//iOS调用RN

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface iOSCallRN : RCTEventEmitter <RCTBridgeModule>

- (instancetype)initWithBridge:(RCTBridge *)bridge;

- (void)iOSCallRN;

- (void)iOSCallRNWithParameter:(NSString *)parame;

@end
