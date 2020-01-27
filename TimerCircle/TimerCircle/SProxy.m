//
//  SProxy.m
//  定时器Test
//
//  Created by Sun on 2020/1/27.
//  Copyright © 2020 sun. All rights reserved.
//

#import "SProxy.h"

/**
 继承自 NSObject 的类，对象调用方法的流程是：

 1.消息发送
 2.动态方法解析
 3.消息转发
 */
@implementation SProxy

+ (instancetype)proxyWithTarget:(id)target {
    // 创建对象
    SProxy *proxy = [[SProxy alloc] init];
    // 设置属性
    proxy.target = target;
    // 返回对象
    return proxy;
}

// 消息转发
- (id)forwardingTargetForSelector:(SEL)aSelector {
    // 转发对象是target
    return self.target;
}

@end
