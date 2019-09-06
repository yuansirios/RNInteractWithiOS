//
//  RNCalliOS.m
//  iOSDemo
//
//  Created by yuan on 2019/9/6.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "RNCalliOS.h"
#import <UIKit/UIKit.h>

@implementation RNCalliOS

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(RNCalliOS) {
    [RNCalliOS showAlert:@"RN调用iOS成功"];
}

RCT_EXPORT_METHOD(RNCalliOSWithParameter:(NSString *)parame) {
    NSString *str = [NSString stringWithFormat:@"RN调用iOS成功，参数：%@",parame];
    [RNCalliOS showAlert:str];
}

RCT_EXPORT_METHOD(RNCalliOSWithCallBack:(RCTResponseSenderBlock)callback) {
    callback(@[@"iOS成功收到消息"]);
    [RNCalliOS showAlert:@"RN调用iOS成功，已成功回调"];
}

RCT_REMAP_METHOD(RNCalliOSWithParameterAndCallBack,
                 para1:(NSString *)para1
                 para2:(NSString *)para2
                 paraDic:(NSDictionary *)paraDic
                 resolver:(RCTPromiseResolveBlock)resolver
                 rejecter:(RCTPromiseRejectBlock)reject) {
    
    NSString *str = [NSString stringWithFormat:@"RN调用iOS成功，para1:%@ para2:%@ paraDic:%@",para1,para2,paraDic];
    [RNCalliOS showAlert:str];
    
    _resolveBlock = resolver;
    _rejectBlock  = reject;
    _resolveBlock(@[@"iOS成功收到消息，有参数"]);
}

+ (void)showAlert:(NSString *)msg{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"iOS Alert" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [view show];
    });
}

@end
