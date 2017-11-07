//
//  NSTimer+JRExtension.m
//  WebView-Object-C
//
//  Created by Johnson Rey on 2017/11/7.
//  Copyright © 2017年 Johnson Rey. All rights reserved.
//

#import "NSTimer+JRExtension.h"

@implementation NSTimer (JRExtension)

- (void)pauseTime {
    if (!self.isValid) {
        return;
    }
    
    [self setFireDate:[NSDate distantFuture]];
}

- (void)webPageTime {
    if (!self.isValid) {
        return;
    }
    [self setFireDate:[NSDate date]];
}

- (void)wh_webPageTimeWithTimeInterval:(NSTimeInterval)interval {
    if (!self.isValid) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
