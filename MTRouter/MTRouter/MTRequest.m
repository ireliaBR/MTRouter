//
//  MTRequest.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTRequest.h"
#import "MTURL.h"

@interface MTRequest()
/**
 URL
 */
@property (nonatomic, strong) MTURL *URL;

/**
 The URL's query parameters.
 */
@property (nonatomic, strong) NSDictionary *queryParams;

@end

@implementation MTRequest
#pragma mark - Lifecycle
- (instancetype)initWithUrlStr:(NSString *)urlStr parameters:(NSDictionary *)parameters
{
    self = [super init];
    if (self) {
        self.URL = [[MTURL alloc] initWithString:urlStr];
        
        NSURLComponents *components = [NSURLComponents componentsWithString:[self.URL absoluteString]];
        NSArray <NSURLQueryItem *> *queryItems = [components queryItems] ?: @[];
        NSMutableDictionary *queryParams = [NSMutableDictionary dictionary];
        for (NSURLQueryItem *item in queryItems) {
            if (item.value == nil) {
                continue;
            }
            queryParams[item.name] = item.value;
        }
        [queryParams addEntriesFromDictionary:parameters];
        self.queryParams = queryParams;
    }
    return self;
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance
#pragma mark - NSObject
- (NSString *)description
{
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendFormat:@"scheme: %@\n", self.URL.scheme];
    [str appendFormat:@"absolutePath: %@\n", self.URL.absolutePath];
    [str appendFormat:@"queryParams: %@", self.queryParams];
    return str;
}
@end
