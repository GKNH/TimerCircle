//
//  SProxy2.h
//  TimerCircle
//
//  Created by Sun on 2020/1/27.
//  Copyright © 2020 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SProxy2 : NSProxy
// 用来初始化并且返回SProxy对象
+ (instancetype)proxyWithTarget:(id)target;
// 用来执行方法的target
@property (weak, nonatomic) id target;
@end

NS_ASSUME_NONNULL_END
