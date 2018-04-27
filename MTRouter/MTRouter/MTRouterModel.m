//
//  MTRouterModel.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTRouterModel.h"
#import "MTURL.h"

@implementation MTRouterModel
#pragma mark - Lifecycle
- (instancetype)initWithUrlstr:(NSString *)urlstr handler:(MTRouterHandler)handler {
    self = [super init];
    if (self) {
        self.type = MTRouterModelTypeHandler;
        self.handler = handler;
        self.URL = [[MTURL alloc] initWithString:urlstr];
    }
    return self;
}

- (instancetype)initWithUrlstr:(NSString *)urlstr ctrlCls:(Class)ctrlCls {
    self = [super init];
    if (self) {
        self.type = MTRouterModelTypeController;
        self.ctrlCls = ctrlCls;
        self.URL = [[MTURL alloc] initWithString:urlstr];
    }
    return self;
}

#pragma mark - Custom Accessors
- (NSString *)registerUser {
    return self.URL.fragment;
}

#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance
#pragma mark - NSObject
- (NSString *)description {
    if (self.type == MTRouterModelTypeHandler) {
        return [NSString stringWithFormat:@"type: MTRouterModelTypeHandler, registerUser: %@", self.registerUser ? : @"main"];
    } else {
        return [NSString stringWithFormat:@"type: MTRouterModelTypeController, registerUser: %@, ctrlCls: %@", self.registerUser ? : @"main", self.ctrlCls];
    }
}
@end
