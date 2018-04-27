//
//  ViewController.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "ViewController.h"
#import "MTRouter.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lifecycle


#pragma mark - Custom Accessors


#pragma mark - IBActions

- (IBAction)pushBtnClick:(id)sender {
    
    
    CFAbsoluteTime routerCtrlSearchStartTime = CFAbsoluteTimeGetCurrent();
    [MTRouter.router pushUrl:@"module://firstCtrl" animated:YES pushNavCtrl:self.navigationController];
    
    CFAbsoluteTime routerCtrlSearchEndTime = CFAbsoluteTimeGetCurrent();
    NSLog(@"[During]路由查询Ctrl事件 during in %f seconds.", (routerCtrlSearchStartTime - routerCtrlSearchEndTime));
    
    
    [self.navigationController pushViewController:[FirstViewController new] animated:YES];
}

- (IBAction)presentBtnClick:(id)sender {
    [MTRouter.router presentUrl:@"module://secondCtrl" animated:YES presentCtrl:self];
}
#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance



@end
