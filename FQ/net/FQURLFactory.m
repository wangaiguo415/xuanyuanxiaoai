//
//  YLURLFactory.m
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import "FQURLFactory.h"
NSString* const kCKBaseUrl_Production = @"https://api.ufengqiu.com";
NSString* const kCKBaseUrl_Staging = @"http://develop.ufengqiu.com";

@implementation FQURLFactory
+ (NSString*)baseUrl
{
#ifdef DEBUG
    return kCKBaseUrl_Staging;
#else
    return kCKBaseUrl_Production;
#endif
}

+ (NSString*)absoluteUrl:(NSString*)relativePath
{
    return [NSString stringWithFormat:@"%@%@", [self baseUrl], relativePath];
}
@end



































































