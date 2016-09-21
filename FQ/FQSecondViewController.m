//
//  FQSecondViewController.m
//  FQ
//
//  Created by wangaiguo on 16/9/18.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "FQSecondViewController.h"

@implementation FQSecondViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    [self makeLabel];
}

-(void)makeLabel{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 20)];
    label.backgroundColor = [UIColor blackColor];
    label.text = @"secondViewController";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}



-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.block) {
        self.block();
    }
    if (self.bBlock) {
        self.bBlock();
    }
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
