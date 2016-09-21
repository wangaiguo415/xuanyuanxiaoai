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
#import "FQSecondViewController.h"

@interface FQFirstViewController (){
    FQFirstAdapter *firstAdapter;
    FQSecondViewController *second;
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

    firstAdapter = [FQFirstAdapter instance];
    __weak FQFirstViewController *me = self;
    [firstAdapter setDidCellSelected:^(UITableView *table, NSIndexPath *indexPath) {
        [me getData];

    }];
    [tableV setAdapter:firstAdapter];
    
    second = [FQSecondViewController instance];
    [second setBBlock:^{
        
    }];
    
    NSLog(@"%@   %@",[tableV.delegate class],[tableV.dataSource class]);
    NSLog(@"%ld",(long)firstAdapter.aaaa);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    NSString * bbb = NSLocalizedString(@"error_data", btn);
    NSLog(@"%@",bbb);
    
}
- (void)btn{
    
    [self presentViewController:second animated:YES completion:nil];
}

- (void)getData{
    FQRequestHandler *handler = [FQRequestHandler defaultHandler:[NSString class]];
    [handler setDidFinished:^(FQHTTPRequestManager *manager, NSString *data) {
        NSLog(@"%@",data);
    }];
    FQHTTPRequestManager *manager = [FQHTTPRequestManager manager:@"https://api.ufengqiu.com/Api/Document/position" handler:handler requestObject:nil];
    [manager get];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
