//
//  UIBarButtonItem+Ex.h
//  KPIsales
//
//  Created by hk on 16/8/24.
//  Copyright © 2016年 mac_zhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Ex)


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title;
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title color:(UIColor *)color;

@end
