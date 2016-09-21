//
//  UIColor+Instance.h
//  ck
//
//  Created by 范文青 on 14-5-28.
//  Copyright (c) 2014年 范文青. All rights reserved.
//
//  颜色直接进行调用

#import <UIKit/UIKit.h>

#define UIBlackColor        [UIColor blackColor]
#define UIWhiteColor        [UIColor whiteColor]
#define UIGrayColor         [UIColor grayColor]
#define UIRedColor          [UIColor redColor]
#define UIGreenColor        [UIColor greenColor]
#define UIBlueColor         [UIColor blueColor]
#define UIClearColor        [UIColor clearColor]
#define UICyanColor         [UIColor cyanColor]


#define UICurrentPageColor      [UIColor currntPageColor]
#define UICellBottomLineColor   RGBCOLOR(222, 223, 222)
#define UIRightBottomColor      [UIColor colorWithHex:@"ff5455"]

@interface UIColor (Instance)
+ (UIColor *)RGBColor:(int)red green:(int)green blue:(int)blue;
+ (UIColor *)RGBColor:(int)red green:(int)green blue:(int)blue alpha:(float)alpha;
+ (UIColor *)randomColor;
+ (UIColor *)colorWithHex:(NSString *)hexColor;
UIKIT_EXTERN UIColor* RGBCOLORA(int r,int g,int b,float a);
UIKIT_EXTERN UIColor* RGBCOLOR(int r,int g,int b);

+ (UIColor *)pinkColor;
+ (UIColor *)currntPageColor;
@end
