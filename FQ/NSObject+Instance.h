//
//  NSObject+Instance.h
//  FQ
//
//  Created by wangaiguo on 16/9/8.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Instance)
+ (instancetype)instance;
@end

@interface UIView (Instance)
+ (instancetype)instance:(CGRect)frame;

@end
