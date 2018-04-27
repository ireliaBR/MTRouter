//
//  Initialization.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "Initialization.h"

@implementation Initialization
#pragma mark - Lifecycle

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public
+ (Initialization *)initObj
{
    static Initialization *ME;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ME = [Initialization new];
        ME.firstCtrlBackgroundColor = [UIColor redColor];
        ME.secondCtrlBackgroundColor = [UIColor greenColor];
    });
    
    return ME;
}

#pragma mark - Private


#pragma mark - Protocol conformance

@end
