//
//  BaseTableViewController.m
//  Dese
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 hewenjie. All rights reserved.
//

#import "BaseTableViewController.h"
#import "UITableView+Gzw.h"

@interface BaseTableViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTableViewController

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource =[NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    [self setUpTalbeView];
}


- (void)setUpTalbeView
{
    self.baseTableView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    self.baseTableView.delegate =self;
    self.baseTableView.dataSource =self;
    self.baseTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    if (kDevice_Is_iPhoneX) {
        self.baseTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever ;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    // 配置参数
    self.baseTableView.buttonText = @"";
    //        self.baseTableView.buttonNormalColor = [UIColor redColor];
    //        self.baseTableView.buttonHighlightColor = [UIColor yellowColor];
    self.baseTableView.descriptionText = @"";
    self.baseTableView.loadedImageName = @"";
    
    self.baseTableView.dataVerticalOffset = 0;
    __weak __typeof(self)weakSelf = self;
    
    self.baseTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个blockx
        
        [weakSelf dropDownMoreData];
        
    }];

//    [self.baseTableView gzwLoading:^{
//        [self.baseTableView.mj_header beginRefreshing];
//        
//    }];
    
    
}


- (void)initFooterView{
    
    self.baseTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self pullUpMoreData];
    }];
}


//下拉
- (void)dropDownMoreData
{
    NSLog(@"下拉刷新");
    
}

//上拉
- (void)pullUpMoreData
{
    
    NSLog(@"上拉加载");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end
