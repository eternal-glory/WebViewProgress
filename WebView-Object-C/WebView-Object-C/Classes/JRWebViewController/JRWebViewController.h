//
//  JRWebViewController.h
//  WebView-Object-C
//
//  Created by Johnson Rey on 2017/11/7.
//  Copyright © 2017年 Johnson Rey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRWebViewController : UIViewController
@property (strong, nonatomic) NSString * urlString;

@property (strong, nonatomic) NSString * webTitle;

@property (strong, nonatomic) UIColor * progressColor;
@end
