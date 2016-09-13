//
//  adapter.h
//  FQ
//
//  Created by wangaiguo on 16/9/8.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface FQAdapter : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,readonly)NSMutableArray *dataSource;
@property(nonatomic,copy)void (^didSelectedRow)(UITableView*tableView, NSIndexPath*indexPath);
@property (nonatomic,weak)UITableView *view;
@property (nonatomic,copy)void (^didScroll)(UITableView *tableV);
- (void)goTop:(BOOL)animated;


@end
