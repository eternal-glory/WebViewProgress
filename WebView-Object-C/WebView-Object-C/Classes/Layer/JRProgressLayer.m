//
//  JRProgressLayer.m
//  WebView-Object-C
//
//  Created by Johnson Rey on 2017/11/7.
//  Copyright © 2017年 Johnson Rey. All rights reserved.
//

#import "JRProgressLayer.h"
#import "NSTimer+JRExtension.h"

static NSTimeInterval const ProgressTimeInterval = 0.03;

@interface JRProgressLayer ()

@property (strong, nonatomic) NSTimer * timer;

@property (assign, nonatomic) CGFloat plusWidth;
@end

@implementation JRProgressLayer

- (instancetype)init {
    if (self = [super init]) {
        [self setupBezier];
    }
    return self;
}

- (void)setupBezier {
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 3)];
    [path addLineToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width, 3)];
    self.path = path.CGPath;
    
    self.strokeEnd = 0;
    _plusWidth = 0.005;
    self.lineWidth = 2;
    self.strokeColor = [UIColor greenColor].CGColor;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:ProgressTimeInterval target:self selector:@selector(pathchanged:) userInfo:nil repeats:YES];
    [_timer pauseTime];
}

- (void)pathchanged:(NSTimer *)timer {
    self.strokeEnd += _plusWidth;
    if (self.strokeEnd > 0.6) {
        _plusWidth = 0.002;
    }
    
    if (self.strokeEnd > 0.85) {
        _plusWidth = 0.0007;
    }
    
    if (self.strokeEnd > 0.93) {
        _plusWidth = 0;
    }
}

- (void)wh_startLoad {
    [_timer wh_webPageTimeWithTimeInterval:ProgressTimeInterval];
}

- (void)wh_finishedLoadWithError:(NSError *)error {
    
    CGFloat timer = 0;
    if (error == nil) {
        [self wh_closeTimer];
        timer = 0.5;
        self.strokeEnd = 1.0;
    } else {
        timer = 45.0;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (timer == 45.0) {
            [self wh_closeTimer];
        }
        self.hidden = YES;
        [self removeFromSuperlayer];
    });
}

- (void)wh_closeTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)dealloc {
    [self wh_closeTimer];
}
@end
