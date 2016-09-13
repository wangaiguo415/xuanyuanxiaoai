//
//  UITableView+adapter.h
//  FQ
//
//  Created by wangaiguo on 16/9/8.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQAdapter.h"
#import "CKTableViewAdapter.h"
@interface UITableView (adapter)

-(void)setAdapter:(CKTableViewAdapter *)adapter;

@end
