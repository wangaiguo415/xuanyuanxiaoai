//
//  FQFirstAdapter.m
//  FQ
//
//  Created by wangaiguo on 16/9/8.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "FQFirstAdapter.h"

@implementation FQFirstAdapter

-(instancetype)init{
    self = [super init];
    if (self) {
        _aaaa = 12345;
    }
    return self;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellString = @"cellString";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellString];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 个",(long)indexPath.row];
    return cell;
}
@end
