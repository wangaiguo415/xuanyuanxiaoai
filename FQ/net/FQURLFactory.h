//
//  YLURLFactory.h
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQURLFactory : NSObject

FOUNDATION_EXTERN NSString *const kCKBaseUrl;

//原型模式
+ (NSString*)absoluteUrl:(NSString*)relativePath;

@end













































