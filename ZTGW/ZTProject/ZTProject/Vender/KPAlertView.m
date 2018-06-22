//
//  KPAlertView.m
//  KPIsales
//
//  Created by hk on 16/9/10.
//  Copyright © 2016年 mac_zhow. All rights reserved.
//

#import "KPAlertView.h"

/*
 全局静态变量，让类方法中的对象持有
 */
static ClickAtIndexBlock      _clickAtIndexBlock;
static ClickActionButtonBlock _clickActionButtonBlock;


typedef enum : NSUInteger {
    AletViewStyleNormal = 300,
    AletViewStyleDouble,
    AletViewStyleOnly,
} AletViewStyle;


@interface  KPAlertView()<UIActionSheetDelegate,UIAlertViewDelegate>

@end


@implementation KPAlertView


+ (UIAlertView *)initWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle otherButtonsArray:(NSArray*)otherButtons clickAtIndex:(ClickAtIndexBlock) clickAtIndex {
    _clickAtIndexBlock = [clickAtIndex copy];
    UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:title message:messge delegate:self cancelButtonTitle:cancleButtonTitle otherButtonTitles: nil];
    for (NSString *otherTitle in otherButtons) {
        [alertView addButtonWithTitle:otherTitle];
    }
    [alertView show];
    alertView.tag = AletViewStyleNormal;
    return alertView;
}
#pragma mark   UIAlertViewDelegate
+(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (alertView.tag) {
        case AletViewStyleNormal:
        {
            _clickAtIndexBlock(buttonIndex);
        }
            break;
        case AletViewStyleDouble:
        {
            if (buttonIndex == 1) {
                _clickActionButtonBlock();
            }
        }
            break;

        case AletViewStyleOnly:
        {
            
        }
            break;

        default:
            break;
    }
    
}
+(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
//    _clickAtIndexBlock = nil;
//    _clickActionButtonBlock = nil;
    
}


+ (UIAlertView *)initWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle actionButtonTitle:(NSString *)actionButtonTitle clickActionButton:(ClickActionButtonBlock) clickActionButton {
    
    _clickActionButtonBlock = [clickActionButton copy];
    UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:title message:messge delegate:self cancelButtonTitle:cancleButtonTitle otherButtonTitles:actionButtonTitle, nil];
    alertView.tag = AletViewStyleDouble;
    [alertView show];
    return alertView;

}

+ (UIAlertView *)initWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle{
    
    UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:title message:messge delegate:self cancelButtonTitle:cancleButtonTitle otherButtonTitles:nil, nil];
    alertView.tag = AletViewStyleOnly;
    [alertView show];
    return alertView;
    
}

@end
