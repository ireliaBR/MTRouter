//
//  MTRouter.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTRouter.h"

// 系统库头文件
#import <objc/runtime.h>

// 第三方库头文件


// 自定义模块的头文件
#import "MTRouterModel.h"
#import "MTURL.h"
#import "MTRequest.h"
#import "MTRouterNoFoundController.h"

@interface MTRouter()

@property (nonatomic, strong) NSMutableDictionary<NSString *,
    NSMutableDictionary<NSString *, MTRouterModel*> *> *schemeDict;

@end

@implementation MTRouter
#pragma mark - Lifecycle


#pragma mark - Custom Accessors
- (NSMutableDictionary<NSString *,NSMutableDictionary<NSString *,MTRouterModel *> *> *)schemeDict {
    if (!_schemeDict) {
        _schemeDict = [[NSMutableDictionary alloc] init];
    }
    return _schemeDict;
}

#pragma mark - IBActions


#pragma mark - Public
+ (MTRouter *)router {
    static MTRouter *ME;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ME = [MTRouter new];
    });
    
    return ME;
}

- (void)registerUrl:(NSString *)url
            handler:(MTRouterHandler)handler {
    MTURL *URL = [self urlCheck:url];
    
    NSMutableDictionary<NSString *, MTRouterModel*> *routerDict = [self getRouterDictWithScheme:URL.scheme];
    NSAssert(routerDict[URL.absolutePath] == nil, @"%@ 已经注册", url);
    
    MTRouterModel *routerModel = [[MTRouterModel alloc] initWithUrlstr:url handler:handler];
    routerDict[URL.absolutePath] = routerModel;
}

- (void)registerUrl:(NSString *)url
      controllerCls:(Class)controllerCls {
    MTURL *URL = [self urlCheck:url];
    
    NSMutableDictionary<NSString *, MTRouterModel*> *routerDict = [self getRouterDictWithScheme:URL.scheme];
    NSAssert(routerDict[URL.absolutePath] == nil, @"%@ 已经注册", url);
    NSAssert([controllerCls isSubclassOfClass:UIViewController.class], @"%@ 不是UIViewController的子类", controllerCls);
    
    MTRouterModel *routerModel = [[MTRouterModel alloc] initWithUrlstr:url ctrlCls:controllerCls];
    routerDict[URL.absolutePath] = routerModel;
}


- (id)executeUrl:(NSString *)url
      parameters:(NSDictionary<NSString *, id> *)parameters {
    MTRequest *request = [[MTRequest alloc] initWithUrlStr:url parameters:parameters];
    
    NSMutableDictionary<NSString *, MTRouterModel*> *routerDict = self.schemeDict[request.URL.scheme];
//    NSAssert(routerDict != nil, @"%@ 未注册", url);
    if (routerDict == nil) {
        return [self createNotFoundControllerWithUrl:url];
    }
    
    MTRouterModel *routerModel = routerDict[request.URL.absolutePath];
//    NSAssert(routerModel != nil, @"%@ 未注册", url);
    if (routerModel == nil) {
        return [self createNotFoundControllerWithUrl:url];
    }
    
    if (routerModel.type == MTRouterModelTypeHandler) {
        return routerModel.handler(request.queryParams);
    }
    return [self createControllerWithCtrlCls:routerModel.ctrlCls queryParams:request.queryParams];
}

- (id)executeUrl:(NSString *)url {
    return [self executeUrl:url parameters:nil];
}

- (void)pushUrl:(NSString *)url
     parameters:(NSDictionary<NSString *, id> *)parameters
       animated:(BOOL)animated
    pushNavCtrl:(UINavigationController *)pushNavCtrl {
    id obj = [self executeUrl:url parameters:parameters];
    NSAssert(obj != nil, @"%@ 不是一个controller路由", url);
    UIViewController *ctrl = (UIViewController *)obj;
    
    [pushNavCtrl pushViewController:ctrl animated:animated];
}

- (void)pushUrl:(NSString *)url
       animated:(BOOL)animated
    pushNavCtrl:(UINavigationController *)pushNavCtrl
{
    [self pushUrl:url parameters:nil animated:animated pushNavCtrl:pushNavCtrl];
}

- (void)presentUrl:(NSString *)url
        parameters:(NSDictionary<NSString *, id> *)parameters
          animated:(BOOL)animated
       presentCtrl:(UIViewController *)presentCtrl
{
    id obj = [self executeUrl:url parameters:parameters];
    NSAssert(obj != nil, @"%@ 不是一个controller路由", url);
    UIViewController *ctrl = (UIViewController *)obj;
    
    [presentCtrl presentViewController:ctrl animated:animated completion:nil];
}

- (void)presentUrl:(NSString *)url
          animated:(BOOL)animated
       presentCtrl:(UIViewController *)presentCtrl
{
    [self presentUrl:url parameters:nil animated:animated presentCtrl:presentCtrl];
}

- (void)dictPrint
{
    NSLog(@"%@", self.schemeDict);
}

#pragma mark - Private

/**
 MTURL的校验

 @param url urlStr
 @return MTURL
 */
- (MTURL *)urlCheck:(NSString *)url {
    MTURL *URL = [[MTURL alloc] initWithString:url];
    NSAssert(URL.scheme != nil, @"%@ scheme不存在", URL.scheme);
    NSAssert(URL.absolutePath != nil, @"%@ absolutePath不存在", URL.scheme);
    return URL;
}

/**
 通过scheme获取routerDict，如果routerDict不存在，则创建

 @param scheme scheme
 @return routerDict
 */
- (NSMutableDictionary<NSString *, MTRouterModel*> *)getRouterDictWithScheme:(nonnull NSString *)scheme {
    if (self.schemeDict[scheme] == nil) {
        self.schemeDict[scheme] = [NSMutableDictionary new];
    }
    return self.schemeDict[scheme];
}

/**
 创建controller，并且导入queryParams

 @param ctrlCls ctrlCls
 @param queryParams queryParams
 @return controller
 */
- (UIViewController *)createControllerWithCtrlCls:(Class)ctrlCls
                                      queryParams:(NSDictionary<NSString *, id> *)queryParams {
    NSAssert([ctrlCls isSubclassOfClass:UIViewController.class], @"%@ 不是UIViewController的子类", ctrlCls);
    UIViewController *ctrl = (UIViewController *)[ctrlCls new];
    [self setQueryParams:queryParams withCtrl:ctrl];
    return ctrl;
}

/**
 设置queryParams到ctrl

 @param queryParams queryParams
 @param ctrl ctrl
 */
- (void)setQueryParams:(NSDictionary<NSString *, id> *)queryParams
              withCtrl:(UIViewController *)ctrl {
    if (queryParams.allKeys.count == 0) {
        return;
    }
    
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList(ctrl.class, &outCount);
    for (int i=0; i<outCount; i++) {
        Ivar ivar = ivars[i];
        NSString *name = [[NSString alloc] initWithUTF8String:ivar_getName(ivar)];
        name = [name substringFromIndex:1];
        if (queryParams[name] != nil) {
            [ctrl setValue:queryParams[name] forKey:name];
        }
    }
    free(ivars);
}

/**
 创建未找到Ctrl

 @param url 路由地址
 @return controller
 */
- (MTRouterNoFoundController *)createNotFoundControllerWithUrl:(NSString *)url {
    MTRouterNoFoundController *notFoundCtrl = [MTRouterNoFoundController new];
    notFoundCtrl.routerAddress = url;
    return notFoundCtrl;
}

#pragma mark - Protocol conformance

@end
