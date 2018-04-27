//
//  MTRequest.h
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MTURL;

/**
 当执行url时，生成request实例
 */
@interface MTRequest : NSObject

/**
 URL
 */
@property (nonatomic, strong, readonly) MTURL *URL;

/**
 The URL's query parameters.
 */
@property (nonatomic, strong, readonly) NSDictionary *queryParams;

- (instancetype)initWithUrlStr:(NSString *)urlStr parameters:(NSDictionary *)parameters;
@end
