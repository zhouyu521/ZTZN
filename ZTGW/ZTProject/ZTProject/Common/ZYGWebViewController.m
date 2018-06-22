//
//  ZYGWebViewController.m
//  Dese
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 hewenjie. All rights reserved.
//

#import "ZYGWebViewController.h"
#import <NJKWebViewProgress/NJKWebViewProgress.h>
#import <NJKWebViewProgress/NJKWebViewProgressView.h>

@interface ZYGWebViewController () <UIWebViewDelegate, NJKWebViewProgressDelegate>

@property (nonatomic,strong) UIProgressView * progressView;
@property (nonatomic,strong) NJKWebViewProgress * progressProxy;
@end

@implementation ZYGWebViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self setUpMyWebView];
    
    [self setUpProgressView];
    [self setUpProgressProxy];
    
    
    
}



-(void)setWebUrl:(NSURL *)webUrl
{
    _webUrl =webUrl;
    
}

- (void)setUpMyWebView
{
    self.webView.scalesPageToFit =YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:_webUrl]];
    
}

- (void)setUpProgressView
{
    
    if (!_progressView) {
        _progressView =[[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
        _progressView.progressViewStyle =UIProgressViewStyleBar;
        [self.webView addSubview:_progressView];
        
    }
    
}

- (void)setUpProgressProxy
{
    if (!_progressProxy) {
        _progressProxy =[[NJKWebViewProgress alloc]init];
        self.webView.delegate = _progressProxy;
        _progressProxy.webViewProxyDelegate = self;
        _progressProxy.progressDelegate = self;
    }
    
}


#pragma mark  NJKWebViewProgressDelegate
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    
    if (progress == 0.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        _progressView.progress = 0;
        [UIView animateWithDuration:0.27 animations:^{
            _progressView.alpha = 1.0;
        }];
    }
    if (progress == 1.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [UIView animateWithDuration:0.27 delay:progress - _progressView.progress options:0 animations:^{
            _progressView.alpha = 0.0;
        } completion:nil];
    }
    
    [_progressView setProgress:progress animated:NO];
    
}

@end
