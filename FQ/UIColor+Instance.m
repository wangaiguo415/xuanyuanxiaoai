//
//  UIColor+Instance.m
//  ck
//
//  Created by 范文青 on 14-5-28.
//  Copyright (c) 2014年 范文青. All rights reserved.
//

#import "UIColor+Instance.h"

@implementation UIColor (Instance)


UIColor* RGBCOLORA(int r,int g,int b,float a){
    return [UIColor RGBColor:r green:g blue:b alpha:a];
}

UIColor* RGBCOLOR(int r,int g,int b){
    return RGBCOLORA(r, g, b, 1.0);
}

+ (UIColor *)RGBColor:(int)red green:(int)green blue:(int)blue
{
    return [UIColor RGBColor:red green:green blue:blue alpha:1.0];
}
+ (UIColor *)RGBColor:(int)red green:(int)green blue:(int)blue alpha:(float)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
+ (UIColor *)randomColor
{
    int r = arc4random()%255;
    int g = arc4random()%255;
    int b = arc4random()%255;
    return RGBCOLOR(r, g, b);
}

+ (UIColor  *)colorWithHex:(NSString *)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}
+ (UIColor *)pinkColor{
    return RGBCOLOR(255, 49, 149);
}
+ (UIColor *)currntPageColor{
    return RGBCOLOR(251, 0, 135);
}
@end
