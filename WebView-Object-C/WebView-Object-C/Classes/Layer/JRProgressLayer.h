//
//  JRProgressLayer.h
//  WebView-Object-C
//
//  Created by Johnson Rey on 2017/11/7.
//  Copyright © 2017年 Johnson Rey. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface JRProgressLayer : CAShapeLayer
- (void)wh_startLoad;

- (void)wh_finishedLoadWithError:(NSError *)error;

- (void)wh_closeTimer;

@end
