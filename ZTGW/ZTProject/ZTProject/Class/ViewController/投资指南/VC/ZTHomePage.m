//
//  ZTHomePage.m
//  ZTProject
//
//  Created by mac_zhou on 2018/6/19.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "ZTHomePage.h"
#import "ZTLoginPage.h"
@interface ZTHomePage ()

@end

@implementation ZTHomePage

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
- (IBAction)presentPage:(UIButton *)sender {
    ZTLoginPage * loginPage =[[ZTLoginPage alloc]init];
    BaseNavController * logNav =[[BaseNavController alloc]initWithRootViewController:loginPage];
    [self presentViewController:logNav animated:YES completion:^{
        
    }];
}

@end
