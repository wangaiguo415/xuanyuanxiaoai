//
//  CKPathGetter.h
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//


#import <Foundation/Foundation.h>
@interface FQPathGetter : NSObject
{
    
}

+ (FQPathGetter *)applicationPath;
- (NSString *)documentPath;
- (NSString *)filePathInDocumentPathForName:(NSString *)fileName;

- (NSString *)resourcePath;
- (NSString *)filePathInResourcePathForName:(NSString *)fullFileName;
- (NSString *)filePathInResourcePathForName:(NSString *)fileName andExtention:(NSString *)ext;

- (NSString *)libaryPath;
- (NSString *)filePathInLibaryPathForName:(NSString *)fullFileName;

- (NSString *)temporaryPath;
- (NSString *)filePathInTemporaryPathForName:(NSString *)fullFileName;


FOUNDATION_EXPORT NSString * UIDocumentFile(NSString *);
FOUNDATION_EXPORT NSString * UIResourceFile(NSString *);
FOUNDATION_EXPORT NSString * UILibaryFile(NSString *);
FOUNDATION_EXPORT NSString * UITemporaryFile(NSString *);

FOUNDATION_EXPORT NSString * UIDocumentPath();
FOUNDATION_EXPORT NSString * UIResourcePath();
FOUNDATION_EXPORT NSString * UILibaryPath();
FOUNDATION_EXPORT NSString * UITemporaryPath();
@end
