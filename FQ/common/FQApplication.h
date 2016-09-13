//  CKApplication.h
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//


#import <Foundation/Foundation.h>

#define MAIN_WINDOW    [[FQApplication currentApplication] mainWindow]
#define SCREEN_BOUNDS  [[FQApplication currentApplication] screenBounds]
#define SCREEN_WIDTH   [[FQApplication currentApplication] screenWidth]
#define SCREEN_HEIGHT  [[FQApplication currentApplication] screenHeight]

#define APPDELEGATE    [[FQApplication currentApplication] appDelegate]


#define INCH4UPPER     [[FQApplication currentApplication] inch4U]

#define TOPHEIGHT      [[FQApplication currentApplication] topHeight]

#define  DIMENSION(dimen)       [[FQApplication currentApplication] dimension:dimen]

#define FRAME_NO_TITLE_BAR  CGRectMake(0, TOPHEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - TOPHEIGHT)
#define FRAME_NO_STATUS_BAR CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20)
#define FRAMe_NO_EVERYTHING CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

#define WEAK_SELF __weak typeof(self) me = self;

#define STATUS_BAR_HEIGHT 20

#define ONE_PIXEL 1.0/[UIScreen mainScreen].scale

@class AppDelegate;
@interface FQApplication : NSObject
{
    
}
+ (FQApplication *)currentApplication;
- (UIWindow *)mainWindow;
- (int)systemVersion;
- (CGRect)screenBounds;
- (float)screenWidth;
- (float)screenHeight;
- (BOOL)inch4U;
- (NSString *)version;
- (AppDelegate *)appDelegate;
- (float)topHeight;
- (NSString *)appleId;
- (NSString *)appleUrl;
- (CGFloat)dimension:(CGFloat)dimension;
- (NSString *)appIndentifier;
+ (NSString *)officialWebsite;
- (BOOL)isFirstInstall;
- (BOOL)isNewVersion;
- (NSString *)userAgent;
//跳转到浏览器，打开链接网址
- (void)openUrl:(NSString *)urlStr;
@end
