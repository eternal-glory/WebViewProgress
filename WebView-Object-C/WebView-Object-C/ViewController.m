//
//  ViewController.m
//  WebView-Object-C
//
//  Created by Johnson Rey on 2017/11/7.
//  Copyright © 2017年 Johnson Rey. All rights reserved.
//

#import "ViewController.h"
#import "JRWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)pushNextController:(UIButton *)sender {
    
    JRWebViewController * webVC = [[JRWebViewController alloc] init];
    webVC.urlString = @"http://www.baidu.com";
    webVC.progressColor = [UIColor purpleColor];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
