//
//  ZYGWebViewController.h
//  Dese
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 hewenjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYGWebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,copy) NSURL *webUrl;



@end
