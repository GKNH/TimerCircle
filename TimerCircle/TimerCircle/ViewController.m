//
//  ViewController.m
//  定时器Test
//
//  Created by Sun on 2020/1/27.
//  Copyright © 2020 sun. All rights reserved.
//

#import "ViewController.h"
#import "SProxy.h"
#import "SProxy2.h"


@interface ViewController ()

@property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self invokeDisplayLink];
    [self invokeTimer];
//    [self invokeTimerWithBlock];
    
}
/**
  使用第三方的方案规避循环引用
  当前方法初始化定时器，定时器不会被自动添加到当前RunLoop中
*/
- (void)invokeDisplayLink {
  
    // CADisplayLink 保证调用频率和屏幕的刷帧频率一致，60FPS
    self.link = [CADisplayLink displayLinkWithTarget:[SProxy2 proxyWithTarget:self] selector:@selector(linkTest)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
/**
 使用第三方的方案规避循环引用
 当前方法初始化定时器，定时器会被自动添加到当前RunLoop中
*/
- (void)invokeTimer {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[SProxy2 proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
}
/**
  使用弱引用加Block的方式，规避循环引用
*/
- (void)invokeTimerWithBlock {
    // 弱引用
    __weak typeof (self)  weakSelf = self;
    // 使用block初始化定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf timerTest];
    }];
}

- (void)timerTest {
    NSLog(@"%s", __func__);
}

- (void)linkTest {
    NSLog(@"%s", __func__);
}

// 销毁定时器
- (void)dealloc {
    NSLog(@"%s", __func__);
//    [self.link invalidate];
    [self.timer invalidate];
}

@end
