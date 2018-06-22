//
//  UIView+Additions.h
//  boleunt
//
//  Created by guojiubo on 12-3-8.
//  Copyright 2012年 boleunt. All rights reserved.
//

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]

#define HIGHLIGHT_ORANGE_COLOR  RGBCOLOR(255, 107, 0)

#import <UIKit/UIKit.h>

@interface UIView (Additions)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;

- (void)introduceSelf;

//获取控件的super tableviewcell
- (UITableViewCell *)tableViewCellWithControl;

//获取控件的super super tableviewcell
- (UITableViewCell *)tableViewCellWithSuperControl;

@end


@interface UIScrollView (Additions)

@property(nonatomic) CGFloat edgeInsetsLeft;
@property(nonatomic) CGFloat edgeInsetsTop;
@property(nonatomic, readonly) CGFloat edgeInsetsRight;
@property(nonatomic, readonly) CGFloat edgeInsetsBottom;

@end
