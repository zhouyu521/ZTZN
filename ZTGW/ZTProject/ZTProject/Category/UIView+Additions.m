//
//  UIView+Additions.m
//  boleunt
//
//  Created by guojiubo on 12-3-8.
//  Copyright 2012年 boleunt. All rights reserved.
//

#import "UIView+Additions.h"


#define kLoginErrorAlert ZYGLocalString(@"ktext7")

@implementation UIView (Additions)

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width - 75;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)introduceSelf
{
	for (UIView *view in self.subviews)
		[view introduceSelf];
}

//获取控件的super tableviewcell
- (UITableViewCell *)tableViewCellWithControl
{
    if (Version8_0) {
        return (UITableViewCell *)[[self superview] superview];
    } else if (Version7_8) {
        return (UITableViewCell *)[[[self superview] superview] superview];
    } else {
        return (UITableViewCell *)[[self superview] superview];
    }
}

//获取控件的super super tableviewcell
- (UITableViewCell *)tableViewCellWithSuperControl
{
    if (Version8_0) {
        return (UITableViewCell *)[[[self superview] superview] superview];
    } else if (Version7_8) {
        return (UITableViewCell *)[[[[self superview] superview] superview] superview];
    } else {
        return (UITableViewCell *)[[[self superview] superview] superview];
    }
}

@end


@implementation UIScrollView (PSCollectionView)

- (CGFloat)edgeInsetsLeft {
    return self.contentInset.left;
}

- (void)setEdgeInsetsLeft:(CGFloat)x {
    UIEdgeInsets frame = self.contentInset;
    frame.left = x;
    self.contentInset = frame;
}

- (CGFloat)edgeInsetsTop {
    return self.contentInset.top;
}

- (void)setEdgeInsetsTop:(CGFloat)x {
    UIEdgeInsets frame = self.contentInset;
    frame.top = x;
    self.contentInset = frame;
}

- (CGFloat)edgeInsetsRight {
    return self.contentInset.right;
}

- (void)setEdgeInsetsRight:(CGFloat)x {
    UIEdgeInsets frame = self.contentInset;
    frame.right = x;
    self.contentInset = frame;
}

- (CGFloat)edgeInsetsBottom {
    return self.contentInset.bottom;
}

- (void)setEdgeInsetsBottom:(CGFloat)x {
    UIEdgeInsets frame = self.contentInset;
    frame.bottom = x;
    self.contentInset = frame;
}

@end

