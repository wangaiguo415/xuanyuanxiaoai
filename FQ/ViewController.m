//
//  ViewController.m
//  FQ
//
//  Created by wangaiguo on 16/9/6.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "ViewController.h"
#import "FQFirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self mbprogressHUD];
    [self makeButton];
    
     NSLog(@"%@",[self debugOrRelease]);
}

//mbprogressHUD
- (void)mbprogressHUD{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"第一次弄这些";
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
    
    if ([view isEqual:self.view]) {
        NSLog(@"1234567890987654321");
    }
    NSLog(@"%@",[view class]);
   
}
- (void)makeButton{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view setTop:10];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setLeft:100 right:300];
    [btn setTop:100 bottom:300];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn setTitle:@"O(∩_∩)O哈哈哈~" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(presentToFQFist) forControlEvents:UIControlEventTouchUpInside];
    
    
}


//判断是release版本还是debug版本
- (NSString *)debugOrRelease{
    
#ifdef DEBUG
    return @"debug";
#else
    return @"release";
#endif
    
}

- (void)presentToFQFist{
    FQFirstViewController *fq = [[FQFirstViewController alloc]init];
    [self presentViewController:fq animated:YES completion:nil];
}




 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
