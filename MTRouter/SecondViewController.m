//
//  SecondViewController.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/22.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "SecondViewController.h"
#import "Initialization.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIButton *cancelBtn;
@end

@implementation SecondViewController

#pragma mark - Lifecycle
- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Initialization.initObj.secondCtrlBackgroundColor;
    [self cancelBtn];
}

#pragma mark - Custom Accessors
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton new];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_cancelBtn setTitle:@"退出" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:_cancelBtn];
        
        [_cancelBtn sizeToFit];
        _cancelBtn.center = self.view.center;
        
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

#pragma mark - IBActions
- (void)cancelBtnClick:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance


@end
