//
//  MTRouterModel.h
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MTURL;
/**
 路由事件block
 
 @param parameters 参数
 @return 返回一个对象，一般来说时ViewController对象
 */
typedef id (^MTRouterHandler)(NSDictionary *parameters);

typedef NS_ENUM(NSUInteger, MTRouterModelType) {
    MTRouterModelTypeController,  //controller
    MTRouterModelTypeHandler, //事件类型
};

/**
 保存在路由dict中的路由对象
 */
@interface MTRouterModel : NSObject

/**
 路由类型
 */
@property (nonatomic, assign) MTRouterModelType type;


/**
 事件,当type为MTRouterModelTypeHandler时，此属性有值
 */
@property (nonatomic, copy) MTRouterHandler handler;


/**
 Controller的class,当type为MTRouterModelTypeController时，此属性有值
 */
@property (nonatomic, assign) Class ctrlCls;

/**
 注册人
 */
@property (nonatomic, copy) NSString *registerUser;

@property (nonatomic, strong) MTURL *URL;

- (instancetype)initWithUrlstr:(NSString *)urlstr handler:(MTRouterHandler)handler;
- (instancetype)initWithUrlstr:(NSString *)urlstr ctrlCls:(Class)ctrlCls;
@end
