//
//  CKTableViewAdapter.h
//  ck
//
//  Created by 范文青 on 14/10/24.
//  Copyright (c) 2014年 范文青. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CKTableViewController;


@interface CKTableViewAdapter : NSObject<UITableViewDataSource,UITableViewDelegate>
- (instancetype)initWithDataSource:(NSArray *)dataSource;
- (void)reloadData:(NSArray *)data;
- (void)appendData:(NSArray *)data;
@property (nonatomic, weak)UITableView *view;
@property (nonatomic, readonly)NSMutableArray *dataSource;
@property (nonatomic,copy)void (^didCellSelected)(id cell,NSIndexPath *indexPath);

//TNANTION:afterReuseCell在tableView中没有用上（UICollecitonView那边有用上）
@property (nonatomic,copy)void (^afterReuseCell)(id cell,NSIndexPath *indexPath);
@property (nonatomic,copy)void (^didScroll)(UITableView *);

@property (nonatomic,assign)BOOL deselectedAnimated;
@property (nonatomic,assign)BOOL callbackOnScrolling;
- (void)goTop:(BOOL)animated;



/********************************  新增  **********************************/

@property(nonatomic, weak)UIViewController *ownerVC;
-(instancetype)initWithOwnerVC:(UIViewController *)ownerVC;

-(void)reloadDataSource:(NSArray *)newData;


- (void)reloadRLMData:(NSArray *)RLMData;
@end
