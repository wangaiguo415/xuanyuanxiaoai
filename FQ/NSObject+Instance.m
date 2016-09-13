//
//  NSObject+Instance.m
//  FQ
//
//  Created by wangaiguo on 16/9/8.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "NSObject+Instance.h"

@implementation NSObject (Instance)
+(instancetype)instance{
    return [[[self class]alloc]init];
}
@end

@implementation UIView (Instance)

+ (instancetype)instance:(CGRect)frame{
    return [[[self class]alloc]initWithFrame:frame];
}

@end