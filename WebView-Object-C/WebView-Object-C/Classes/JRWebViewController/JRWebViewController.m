//
//  JRWebViewController.m
//  WebView-Object-C
//
//  Created by Johnson Rey on 2017/11/7.
//  Copyright © 2017年 Johnson Rey. All rights reserved.
//

#import "JRWebViewController.h"
#import "JRProgressLayer.h"
#import <WebKit/WebKit.h>
@interface JRWebViewController () <WKNavigationDelegate>

@property (strong, nonatomic) WKWebView * webView;

@property (strong, nonatomic) JRProgressLayer * progressLayer;

@end

@implementation JRWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.webTitle;
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.webView];
    [self.navigationController.navigationBar.layer addSublayer:self.progressLayer];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.progressLayer wh_startLoad];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.progressLayer wh_finishedLoadWithError:nil];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [self.progressLayer wh_finishedLoadWithError:error];
}

- (void)dealloc {
    [self.progressLayer wh_closeTimer];
    [self.progressLayer removeFromSuperlayer];
    _progressLayer = nil;
}

#pragma mark - - loading lazy
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
        [_webView loadRequest:request];
    }
    return _webView;
}

- (JRProgressLayer *)progressLayer {
    
    if (!_progressLayer) {
        _progressLayer = [[JRProgressLayer alloc] init];
        _progressLayer.frame = CGRectMake(0, 42, [UIScreen mainScreen].bounds.size.width, 2);
        if (self.progressColor) {
            _progressLayer.strokeColor = self.progressColor.CGColor;
        }
    }
    
    return _progressLayer;
}

@end
