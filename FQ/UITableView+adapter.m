//
//  UITableView+adapter.m
//  FQ
//
//  Created by wangaiguo on 16/9/8.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "UITableView+adapter.h"



@implementation UITableView (adapter)
-(void)setAdapter:(CKTableViewAdapter *)adapter{
    
//    [self setDataSource:adapter];
//    [self setDelegate:adapter];
//    [adapter setView:self];    
    self.delegate = adapter;
    self.dataSource = adapter;
    adapter.view = self;
}
@end
