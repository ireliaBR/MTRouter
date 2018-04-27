//
//  FirstViewController.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "FirstViewController.h"
#import "Initialization.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

#pragma mark - Lifecycle
- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Initialization.initObj.firstCtrlBackgroundColor;
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance


@end
