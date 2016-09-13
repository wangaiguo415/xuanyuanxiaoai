//
//  CKTableViewAdapter.m
//  ck
//
//  Created by 范文青 on 14/10/24.
//  Copyright (c) 2014年 范文青. All rights reserved.
//

#import "CKTableViewAdapter.h"
@interface CKTableViewAdapter()
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation CKTableViewAdapter
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //TNWarning: callbackOnScrolling属性在scrollViewDidScroll入口处作为判断条件
        self.callbackOnScrolling = YES;
    }
    return self;
}



- (instancetype)initWithDataSource:(NSArray *)dataSource
{
    //TNWarning:调用[self init] -- 已经重写了init 重写的时候会调用到 [super init]
    self = [self init];
    if (self)
    {
        self.dataSource = [NSMutableArray arrayWithArray:dataSource];
        self.deselectedAnimated = NO;
    }
    return self;
}



- (void)goTop:(BOOL)animated{
    [self.view setContentOffset:CGPointZero animated:animated];
}



- (void)reloadData:(NSArray *)data
{
    self.dataSource = [data mutableCopy];
    [self.view reloadData];
}


- (void)appendData:(NSArray *)data
{
    [self.dataSource addObjectsFromArray:data];
    [self.view reloadData];
}



- (void)setView:(UITableView *)view
{
    _view = view;
    [self afterSetView];
}



- (void)afterSetView
{
    
}


- (void)cellSelected:(NSIndexPath *)indexPath
{
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:_deselectedAnimated];
    [self cellSelected:indexPath];
    
    if (self.didCellSelected)
    {
        self.didCellSelected([tableView cellForRowAtIndexPath:indexPath],indexPath);
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)sender
{
    
    if (_didScroll && _callbackOnScrolling )
    {
        _didScroll(self.view);
    }
 
    
}

/********************************  新增  **********************************/

//把sectionHeader的颜色都改成CKTableViewBGGrayColor[在iphone4上有误]
//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [UIView instance];
//    [headerView setBackgroundColor:CKTableViewBGGrayColor];
//    return headerView;
//    
//}

//取到adapter所属的tableView所在最近的VC
-(instancetype)initWithOwnerVC:(UIViewController *)ownerVC{
    self = [super init];
    if (self){
        self.ownerVC = ownerVC;
        //TNDOORS: callbackOnScrolling属性在scrollViewDidScroll入口处作为判断条件
        self.callbackOnScrolling = YES;
    }
    return self;
}

//更改dataSource
-(void)reloadDataSource:(NSArray *)newData{
    self.dataSource = [NSMutableArray arrayWithArray:newData];
}


//RLM数据库DBData不能调用mutableCopy，目前不知道该方法有没有什么副作用。
- (void)reloadRLMData:(NSArray *)RLMData
{
    self.dataSource = (NSMutableArray *)RLMData ;
    [self.view reloadData];
}
//////////////////////////////////////////////////////////////////////////

@end
