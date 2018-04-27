//
//  Initialization.h
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 模块初始化对象
 */
@interface Initialization : NSObject
/**
 单例
 */
@property (nonatomic, strong, class, readonly) Initialization *initObj;

@property (nonatomic, strong) UIColor *firstCtrlBackgroundColor;
@property (nonatomic, strong) UIColor *secondCtrlBackgroundColor;

@end
