//
//  FQFirstViewController.m
//  FQ
//
//  Created by wangaiguo on 16/9/8.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "FQFirstViewController.h"
#import "FQFirstAdapter.h"
#import "FQTestController.h"

@interface FQFirstViewController (){
    FQFirstAdapter *firstAdapter;
}

@end

@implementation FQFirstViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(100, 100, 150, 300) style:UITableViewStylePlain];
    tableV.tag = 100;
    [self.view addSubview:tableV];
    tableV.backgroundColor = [UIColor yellowColor];
//    
//    FQTestController * fqt = [FQTestController instance];
//    tableV.dataSource = fqt;
//    tableV.delegate = fqt;

    firstAdapter = [FQFirstAdapter instance];
//    [firstAdapter setDidSelectedRow:^(UITableView *table, NSIndexPath *indexPath) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }];
    [tableV setAdapter:firstAdapter];
    
    
    
//    [tableV reloadData];
    
    NSLog(@"%@   %@",[tableV.delegate class],[tableV.dataSource class]);
    NSLog(@"%ld",firstAdapter.aaaa);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    NSString * bbb = NSLocalizedString(@"error_data", nil);
    NSLog(@"%@",bbb);
    
}
- (void)btn{
    UITableView *table = [self.view viewWithTag:100];
    [table reloadData];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
