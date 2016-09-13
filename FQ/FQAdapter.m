//
//  adapter.m
//  FQ
//
//  Created by wangaiguo on 16/9/8.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "FQAdapter.h"

@interface FQAdapter ()

@end

@implementation FQAdapter

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectedRow) {
        self.didSelectedRow(tableView,indexPath);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellString = @"cellString";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellString];
    }
   cell.textLabel.text = [NSString stringWithFormat:@"the %ld 个",(long)indexPath.row];
    return cell;
}

-(void)setView:(UITableView *)view{
    _view = view;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.didScroll) {
        self.didScroll(self.view);
    }
}
-(void)goTop:(BOOL)animated{
    [self.view setContentOffset:CGPointZero animated:YES];
}

@end
