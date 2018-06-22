//
//  KPAlertView.h
//  KPIsales
//
//  Created by hk on 16/9/10.
//  Copyright © 2016年 mac_zhow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ClickAtIndexBlock)(NSInteger buttonIndex);
typedef void (^ClickActionButtonBlock)();


@interface KPAlertView : NSObject

// 通用样式 有index
+ (UIAlertView *)initWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle otherButtonsArray:(NSArray *)otherButtons clickAtIndex:(ClickAtIndexBlock)clickAtIndex;

// 左右样式，右边按钮是动作按钮
+ (UIAlertView *)initWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle actionButtonTitle:(NSString *)actionButtonTitle clickActionButton:(ClickActionButtonBlock)clickActionButton;

// 唯一样式，只有一个按钮
+ (UIAlertView *)initWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle;

@end
