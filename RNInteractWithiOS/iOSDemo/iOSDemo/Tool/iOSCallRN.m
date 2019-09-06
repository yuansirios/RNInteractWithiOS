
#import "iOSCallRN.h"

//和JS文件中定义的一样，可以理解为通知标识
static NSString * const method  = @"iOSCallRN";
static NSString * const method1 = @"iOSCallRNWithParameter";

@implementation iOSCallRN

RCT_EXPORT_MODULE();

- (instancetype)initWithBridge:(RCTBridge *)bridge{
    if (self = [super init]) {
        if (bridge) {
            [self setValue:bridge forKey:@"bridge"];
        }
    }
    return self;
}

- (NSArray<NSString *> *)supportedEvents{
  return @[method,method1];
}

RCT_EXPORT_METHOD(iOSCallRN) {
    [self.bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                        method:@"emit"
                          args:@[method]
                    completion:^{
                        NSLog(@"iOSCallRN调用成功！");
                    }];
}


RCT_EXPORT_METHOD(iOSCallRNWithParameter:(NSString *)parame) {
    [self.bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                        method:@"emit"
                          args:@[method1,parame]
                    completion:^{
                        NSLog(@"iOSCallRNWithParameter调用成功！");
                    }];
}

@end
