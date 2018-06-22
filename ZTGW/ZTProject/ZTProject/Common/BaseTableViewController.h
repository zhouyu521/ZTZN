//
//  BaseTableViewController.h
//  Dese
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 hewenjie. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^RefreshBlock)(void);

@interface BaseTableViewController : BaseViewController
@property (strong, nonatomic) IBOutlet UITableView *baseTableView;
@property (nonatomic,retain) NSMutableArray * dataSource;
@property (nonatomic,assign) NSInteger curPage;
@property (nonatomic,copy) RefreshBlock refreshBlock;
- (void)initFooterView;

//下拉
- (void)dropDownMoreData;

//上拉
- (void)pullUpMoreData;

@end
