//
//  SProxy2.m
//  TimerCircle
//
//  Created by Sun on 2020/1/27.
//  Copyright © 2020 sun. All rights reserved.
//

#import "SProxy2.h"

/**

Proxy：中间对象，代理
NSProxy 是专门用做消息转发的基类(NSObject也是基类)
 
继承自 NSProxy 的类，对象调用方法的流程是:

1.消息发送：
就是简单地检查本类中是否存在该方法，如果有直接调用，
如果没有直接下一步消息转发。
（不会像SProxy消息发送那样，再去父类中寻找方法等等）
2.消息转发

优点： 效率高
*/
@implementation SProxy2

+ (instancetype)proxyWithTarget:(id)target {
    // 创建对象
    SProxy2 *proxy = [SProxy2 alloc];
    // 设置属性
    proxy.target = target;
    // 返回对象
    return proxy;
}

// 返回方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    // 返回 target 方法的签名
    return [self.target methodSignatureForSelector:sel];
}

// forward: 发送
// Invocation: 调用
- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
