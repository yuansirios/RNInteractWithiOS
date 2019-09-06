//
//  RNCalliOS.h
//  iOSDemo
//
//  Created by yuan on 2019/9/6.
//  Copyright © 2019 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNCalliOS : NSObject<RCTBridgeModule>{
    RCTPromiseResolveBlock _resolveBlock;
    RCTPromiseRejectBlock  _rejectBlock;
}

@end

NS_ASSUME_NONNULL_END
