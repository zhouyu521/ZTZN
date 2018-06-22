//
//  ZTLoginPage.m
//  ZTProject
//
//  Created by mac_zhou on 2018/6/19.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "ZTLoginPage.h"
#import "ZYGWebViewController.h"
@interface ZTLoginPage ()

@end

@implementation ZTLoginPage

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)disMissAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark ---跳转投资指南
- (IBAction)pushAgreeAction:(UIButton *)sender {
    ZYGWebViewController * webVc =[[ZYGWebViewController alloc]init];
    webVc.webUrl =[NSURL URLWithString:@"http://www.baidu.com"];
       [self.navigationController pushViewController:webVc animated:YES];
 
}

@end
