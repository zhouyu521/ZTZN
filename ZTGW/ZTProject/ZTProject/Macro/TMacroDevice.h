//
//  TMacroDevice.h
//  DeSe
//
//  Created by 贺 on 16/1/19.
//  Copyright © 2015年 滕泰翼. All rights reserved.
//


#define kJpushKey                   @"cf3dadbf508b3c5ce7e23fd8"//套路


#define k_PinkColor RGB(255, 0, 121, 1)

//是否为iphone4,4S屏幕
#define iPhone4         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//是否为iphone5,5C,5S屏幕
#define iPhone5         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//是否为iphone6屏幕
#define iPhone6         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//是否为iphone6plus屏幕
#define iPhone6Plus     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否为7.0到8.0之间系统
#define Version7_8       (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) ? YES : NO)

//判断是否为8.0以上系统
#define Version8_0       (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO)

//判断是否为8.0到9.0之间系统
#define Version8_9       (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0) ? YES : NO)

//判断是否为9.0以上系统
#define Version9_0       (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)

//判断是否为10.0以上系统
#define Version10_0       (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) ? YES : NO)

//判断是否为iPad或iPod touch设备
#define iPadDevice      ([[UIDevice currentDevice].model isEqualToString:@"iPad"] || [[UIDevice currentDevice].model isEqualToString:@"iPad Simulator"] ? YES : NO )
#define iPodtouchDevice ([[UIDevice currentDevice].model isEqualToString:@"IPod Touch"] ? YES : NO )

//获取Cell高度
#define CellHeight (iPhone6Plus ? 55.0 : (iPhone6 ? 50.0 : 45.0))

#define RGB(r,g,b,a)  [UIColor colorWithRed:(double)r/255.0f green:(double)g/255.0f blue:(double)b/255.0f alpha:a]

//屏幕宽和高
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width



#define ScaleX kScreenWidth / 375.f
#define ScaleY kScreenHeight / 667.f

#define arc4randomColor (float)(arc4random()%244) / 255.0
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

#define Max_CountTime 60//统一验证码倒计时

#define k_window  [UIApplication sharedApplication].delegate.window


#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define K_ServerUrl @"http://pre.desew.com"

//database----
#define K_LoginTable  @"loginTable"
#define K_LoginUserID  @"loginUserID"

