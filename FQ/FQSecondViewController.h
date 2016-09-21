//
//  FQSecondViewController.h
//  FQ
//
//  Created by wangaiguo on 16/9/18.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^aBlock)();

@interface FQSecondViewController : UIViewController

@property (nonatomic,copy) aBlock block;
@property (nonatomic,copy) void ((^bBlock)());

@end
