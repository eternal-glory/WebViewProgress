//
//  NSTimer+JRExtension.h
//  WebView-Object-C
//
//  Created by Johnson Rey on 2017/11/7.
//  Copyright © 2017年 Johnson Rey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (JRExtension)
- (void)pauseTime;

- (void)webPageTime;

- (void)wh_webPageTimeWithTimeInterval:(NSTimeInterval)interval;
@end
