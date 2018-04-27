//
//  MTURL.h
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 urlStr对应的MTURL
 */
@interface MTURL : NSURL


/**
 url的全路径，host+path，例如：http://aaa/bbb的absolutePath为 `aaa/bbb`
 */
@property (nonatomic, copy) NSString *absolutePath;
@end
