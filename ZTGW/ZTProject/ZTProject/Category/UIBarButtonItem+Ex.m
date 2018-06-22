//
//  UIBarButtonItem+Ex.m
//  KPIsales
//
//  Created by hk on 16/8/24.
//  Copyright © 2016年 mac_zhow. All rights reserved.
//

#import "UIBarButtonItem+Ex.h"
#import "UIView+Frame.h"

@implementation UIBarButtonItem (Ex)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:(UIBarButtonItemStylePlain) target:target action:action];
    [barButtonItem setTintColor:RGB(3, 3, 3, 1)];
    return barButtonItem;
}


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title color:(UIColor *)color {
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:(UIBarButtonItemStylePlain) target:target action:action];
    [barButtonItem setTintColor:color];
    return barButtonItem;
}

@end
