//
//  MTRouterNoFoundController.h
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/27.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 未找到Controller（没有找到路由对应的controller时返回此Controller）
 */
@interface MTRouterNoFoundController : UIViewController

/**
 路由地址
 */
@property (nonatomic, copy) NSString *routerAddress;
@end
