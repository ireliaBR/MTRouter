//
//  MTRouterNoFoundController.m
//  MTRouter
//
//  Created by 范冬冬 on 2018/4/27.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTRouterNoFoundController.h"

@interface MTRouterNoFoundController ()
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation MTRouterNoFoundController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.contentLabel];
    self.contentLabel.text = [NSString stringWithFormat:@"路由：%@，不存在", self.routerAddress];
    [self.contentLabel sizeToFit];
    self.contentLabel.center = self.view.center;
    
    [self.view addSubview:self.cancelButton];
    [self.cancelButton sizeToFit];
    self.cancelButton.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)/2-100);
}

#pragma mark - Custom Accessors
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:16];
    }
    return _contentLabel;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton new];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_cancelButton setTitle:@"返回" forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

#pragma mark - IBActions
- (void)cancelButtonClick:(UIButton *)btn {
    if (self.presentingViewController == nil) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance


@end
