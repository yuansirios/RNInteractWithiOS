//
//  ViewController.m
//  iOSDemo
//
//  Created by yuan on 2019/9/5.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>

#import "iOSCallRN.h"
#import "RNCalliOS.h"
#import "UIView+Layout.h"

@interface ViewController ()<RCTBridgeDelegate>{
    NSArray     *_listArr;
    iOSCallRN   *_iOSCall;
    RCTBridge   *_bridge;
    RCTRootView *_rnView;
}

@end

@implementation ViewController

#pragma mark - *********** RN设置 ***********

- (void)setUpBridge{
    _bridge  = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
    _iOSCall = [[iOSCallRN alloc]initWithBridge:_bridge];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
#if DEBUG
    return [NSURL URLWithString:@"http://localhost:8081/RN/index.bundle?platform=ios"];
#else
    return [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"jsbundle"];
#endif
}

#pragma mark - *********** iOS调用RN ***********

- (void)iOSCallRN{
    [_iOSCall iOSCallRN];
}

- (void)iOSCallRNWithParameter{
    [_iOSCall iOSCallRNWithParameter:@"我是参数"];
}

#pragma mark - *********** ViewController ***********

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBridge];
    self.title = @"iOS和RN原生交互";
    
    float btnW = (self.view.width - 20*3)/2;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 80, btnW, 50);
    [btn setBackgroundColor:[UIColor greenColor]];
    [btn setTitle:@"调用RN" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(iOSCallRN) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(btn.right + 10, 80, btnW, 50);
    [btn2 setBackgroundColor:[UIColor purpleColor]];
    [btn2 setTitle:@"调用RN，带参数" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(iOSCallRNWithParameter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    RCTRootView *rnView = [[RCTRootView alloc] initWithBridge:_bridge
                                                   moduleName:@"AView"
                                            initialProperties:@{@"value":@"成功加载！！！"}];
    CGFloat vTop = btn.bottom + 20;
    rnView.frame = CGRectMake(btn.left, vTop, self.view.width - 20*2, self.view.height - vTop - btn.left);
    [self.view addSubview:rnView];
    _rnView = rnView;
}

@end

