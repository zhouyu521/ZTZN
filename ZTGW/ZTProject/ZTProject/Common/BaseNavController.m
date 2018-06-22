//
//  BaseNavController.m
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "BaseNavController.h"
#import "UIBarButtonItem+Ex.h"
@interface BaseNavController ()<UINavigationControllerDelegate>

@end


@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate =self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count>0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem =[UIBarButtonItem itemWithTarget:self action:@selector(popback) image:@"left_back" highImage:@"left_back"];
    }
    [super pushViewController:viewController animated:animated];
    
    
}


-(void)popback
{
    [self popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
