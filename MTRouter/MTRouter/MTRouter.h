//
//  MTRouter.h
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MTRouterModel.h"

/**
 路由
 */
@interface MTRouter : NSObject

/**
 路由单例
 */
@property (nonatomic, strong, class ,readonly)MTRouter *router;

/**
 注册一个路由，触发handler事件，通常来说用于模块初始化设置，模块Controller实例之间参数传递,
 不建议乱用

 @param url 路由地址， 格式：RouterModuleScheme://path
 @param handler 事件
 */
- (void)registerUrl:(nonnull NSString *)url
            handler:(nonnull MTRouterHandler)handler;

/**
 注册一个controller的路由

 @param url 路由地址， 格式：RouterModuleScheme://ViewController
 @param controllerCls 必须为ViewController的子类，否则会抛出异常
 */
- (void)registerUrl:(nonnull NSString *)url
      controllerCls:(nonnull Class)controllerCls;

/**
 触发一个路由,当是Controller的路由时，会返回Controller

 @param url 路由地址， 格式：RouterModuleScheme://path?param1=value1&param2=value2
 @param parameters 参数，当parameters的key和url中query有相同的key时，parameters会覆盖它
 @return 返回一个实例，一般来说是ViewController的子类
 */
- (id)executeUrl:(nonnull NSString *)url
      parameters:(nullable NSDictionary<NSString *, id> *)parameters;

/**
 触发一个路由,当是Controller的路由时，会返回Controller

 @param url 路由地址， 格式：RouterModuleScheme://path?param1=value1&param2=value2
 @return 返回一个实例，一般来说是ViewController的子类
 */
- (id)executeUrl:(nonnull NSString *)url;

/**
 push出url对应的Controller

 @param url 路由地址，必须为Controller对应的路由，否则会抛出异常
 @param parameters 参数，当parameters的key和url中query有相同的key时，parameters会覆盖它
 @param animated 是否动画
 @param pushNavCtrl 需要push的navCtrl
 */
- (void)pushUrl:(nonnull NSString *)url
     parameters:(nullable NSDictionary<NSString *, id> *)parameters
       animated:(BOOL)animated
    pushNavCtrl:(nonnull UINavigationController *)pushNavCtrl;

/**
 push出url对应的Controller
 
 @param url 路由地址，必须为Controller对应的路由，否则会抛出异常
 @param animated 是否动画
 @param pushNavCtrl 需要push的navCtrl
 */
- (void)pushUrl:(nonnull NSString *)url
       animated:(BOOL)animated
    pushNavCtrl:(nonnull UINavigationController *)pushNavCtrl;

/**
 present出url对应的Controller

 @param url url 路由地址，必须为Controller对应的路由，否则会抛出异常
 @param parameters 参数，当parameters的key和url中query有相同的key时，parameters会覆盖它
 @param animated 是否动画
 @param presentCtrl present的Ctrl
 */
- (void)presentUrl:(nonnull NSString *)url
        parameters:(nullable NSDictionary<NSString *, id> *)parameters
          animated:(BOOL)animated
       presentCtrl:(nonnull UIViewController *)presentCtrl;

/**
 present出url对应的Controller
 
 @param url url 路由地址，必须为Controller对应的路由，否则会抛出异常
 @param animated 是否动画
 @param presentCtrl present的Ctrl
 */
- (void)presentUrl:(nonnull NSString *)url
          animated:(BOOL)animated
       presentCtrl:(nonnull UIViewController *)presentCtrl;


/**
 存储结构打印
 */
- (void)dictPrint;
@end
