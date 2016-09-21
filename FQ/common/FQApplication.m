//  CKApplication.m
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import "FQApplication.h"
#import "CWLSynthesizeSingleton.h"
@interface FQApplication()
{
    
}
@end

@implementation FQApplication
CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(FQApplication,currentApplication);
- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (UIWindow *)mainWindow
{
    return [[[UIApplication sharedApplication] delegate] window];
}
- (float)topHeight
{
    return 64;
}
- (CGRect)screenBounds
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    return bounds;
}
- (float)screenScale
{
    return [[UIScreen mainScreen] scale];
}
- (float)screenWidth
{
    return [self screenBounds].size.width;
}
- (float)screenHeight
{
    return [self screenBounds].size.height;
}
- (int)systemVersion
{
    return [[[UIDevice currentDevice] systemVersion] intValue];
}

- (BOOL)inch4U
{
    return [self screenHeight] >= 548;
}
- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
- (NSString *)shortVersion
{
   return  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
- (NSString *)version
{
    return [self shortVersion];
}
- (NSString *)appleId
{
    return @"1052661231";
}
- (NSString *)appleUrl
{
    NSString * appstoreUrlString = @"http://itunes.apple.com/cn/app/id%@?mt=8";
    appstoreUrlString = [NSString stringWithFormat:appstoreUrlString,[self appleId]];
    return appstoreUrlString;
}
- (CGFloat)dimension:(CGFloat)dimension{
    return ceil((dimension / 320.0) * SCREEN_WIDTH);
}
- (NSString *)appIndentifier{
    return [NSString stringWithFormat:@"ios%@",[self version]];
}
+ (NSString *)officialWebsite{
    return @"http://www.ylly.com";
}

//跳转到浏览器，打开链接网址
- (void)openUrl:(NSString *)urlStr
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}
- (BOOL)isFirstInstall{
    NSString *installed = [[NSUserDefaults standardUserDefaults] objectForKey:@"installed"];
    [[NSUserDefaults standardUserDefaults] setObject:@"installed" forKey:@"installed"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (installed.length == 0) {
        return YES;
    }
    return NO;
}
- (BOOL)isNewVersion{
    NSString* currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    NSString* versionOfLastRun = [[NSUserDefaults standardUserDefaults] objectForKey:@"VersionOfLastRun"];
    [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"VersionOfLastRun"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (versionOfLastRun == nil) {
        return YES;
    } else if (![versionOfLastRun isEqual:currentVersion]) {
        return YES;
    }
    return NO;
}
- (NSString *)userAgent{
    NSString *version = [self version];
    NSString *name = @"ufengqiu";
    return [NSString stringWithFormat:@"%@_%@",name,version];
}
@end
