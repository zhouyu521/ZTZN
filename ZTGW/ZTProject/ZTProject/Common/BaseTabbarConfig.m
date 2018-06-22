//
//  BaseTabbarConfig.m
//  TLYL
//
//  Created by mac_zhou on 2018/3/7.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "BaseTabbarConfig.h"
#import "ZTHomePage.h"
#import "ZTDynamicPage.h"
#import "ZTAttentionPage.h"
#import "ZTPurchasedPage.h"
#import "ZTMyPage.h"
#import "BaseNavController.h"

@interface BaseTabbarConfig ()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation BaseTabbarConfig

- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        /**
         * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
         * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
         * 更推荐后一种做法。
         */
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);
        
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                             imageInsets:imageInsets
                                                                                 titlePositionAdjustment:titlePositionAdjustment
                                                                                                 context:self.context
                                                 ];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}



- (NSArray *)viewControllers {
    ZTHomePage *homePage = [[ZTHomePage alloc] init];
    
    BaseNavController *homeNav = [[BaseNavController alloc]
                                  initWithRootViewController:homePage];
    
    ZTDynamicPage *dtPage = [[ZTDynamicPage alloc] init];
    
    BaseNavController *dtNav = [[BaseNavController alloc]
                                  initWithRootViewController:dtPage];
    
    ZTAttentionPage *attPage = [[ZTAttentionPage alloc] init];
    
    BaseNavController *attNav = [[BaseNavController alloc]
                                initWithRootViewController:attPage];
    
    ZTPurchasedPage *buyPage = [[ZTPurchasedPage alloc] init];
    
    BaseNavController *buyNav = [[BaseNavController alloc]
                                initWithRootViewController:buyPage];
    
    ZTMyPage *myPage = [[ZTMyPage alloc] init];
    
    BaseNavController *myNav = [[BaseNavController alloc]
                                initWithRootViewController:myPage];
    
    
    
    NSArray *viewControllers = @[
                                 homeNav,
                                 dtNav,
                                 attNav,
                                 buyNav,
                                 myNav
                                 ];
    return viewControllers;
}


- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"指南",
                                                 CYLTabBarItemImage : @"unDiscover",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"selDiscover", /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"动态",
                                                  CYLTabBarItemImage : @"unChat",
                                                  CYLTabBarItemSelectedImage : @"selChat",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"关注",
                                                 CYLTabBarItemImage : @"unMy",
                                                 CYLTabBarItemSelectedImage : @"selMy",
                                                 };
    NSDictionary *purchaseTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"已购",
                                                 CYLTabBarItemImage : @"unDiscover",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"selDiscover", /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *myTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"unChat",
                                                  CYLTabBarItemSelectedImage : @"selChat",
                                                  };

    
    
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       purchaseTabBarItemsAttributes,
                                       myTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}


/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
#warning CUSTOMIZE YOUR TABBAR APPEARANCE
    // Customize UITabBar height
    // 自定义 TabBar 高度
    tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 40;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    //    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    
    //FIXED: #196
    UIImage *tabBarBackgroundImage = [UIImage imageNamed:@"tab_bar"];
    //    UIImage *scanedTabBarBackgroundImage = [[self class] scaleImage:tabBarBackgroundImage toScale:1.0];
    //     [tabBarAppearance setBackgroundImage:scanedTabBarBackgroundImage];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // iOS10 后 需要使用 `-[CYLTabBarController hideTabBadgeBackgroundSeparator]` 见 AppDelegate 类中的演示;
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}




@end
