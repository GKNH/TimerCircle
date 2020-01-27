//
//  ViewController.m
//  定时器Test
//
//  Created by Sun on 2020/1/27.
//  Copyright © 2020 sun. All rights reserved.
//

#import "ViewController.h"
#import "SProxy.h"

/**
 SProxy 作为 target 执行 timerTest 方法
 */
@interface ViewController ()

@property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    // CADisplayLink 保证调用频率和屏幕的刷帧频率一致，60FPS
//    self.link = [CADisplayLink displayLinkWithTarget:[SProxy proxyWithTarget:self] selector:@selector(linkTest)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    // 自动加到当前TRunLoop中
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[SProxy proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
    
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
