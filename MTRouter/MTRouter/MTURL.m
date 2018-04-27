//
//  MTURL.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTURL.h"

@implementation MTURL
#pragma mark - Lifecycle


#pragma mark - Custom Accessors
- (NSString *)absolutePath
{
    return [self.host stringByAppendingPathComponent:self.path];
}

#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance

@end
