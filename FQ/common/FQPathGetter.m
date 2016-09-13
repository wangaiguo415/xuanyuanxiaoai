//
//  CKPathGetter.m
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import "FQPathGetter.h"
#import "CWLSynthesizeSingleton.h"
@implementation FQPathGetter
CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(FQPathGetter, applicationPath)

- (NSString *)documentPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
   
}

- (NSString *)filePathInDocumentPathForName:(NSString *)fileName{
    NSString *documentsDirectory = [self documentPath];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

- (NSString *)resourcePath{
    return [[NSBundle mainBundle] resourcePath];
}
//读取文件方法
- (NSString *)filePathInResourcePathForName:(NSString *)fullFileName{
    return [[NSBundle mainBundle] pathForResource:fullFileName ofType:nil];
  
}
- (NSString *)filePathInResourcePathForName:(NSString *)fileName andExtention:(NSString *)ext{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:ext];
}

- (NSString *)libaryPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libaryDirectory = [paths objectAtIndex:0];
    return libaryDirectory;
}

- (NSString *)filePathInLibaryPathForName:(NSString *)fullFileName{
    NSString *libaryDirectory = [self libaryPath];
    return [libaryDirectory stringByAppendingPathComponent:fullFileName];
}

- (NSString *)temporaryPath{
    return NSTemporaryDirectory();
}
- (NSString *)filePathInTemporaryPathForName:(NSString *)fullFileName{
    NSString *tempPath = [self temporaryPath];
    return [tempPath stringByAppendingPathComponent:fullFileName];
}
NSString * UIDocumentFile(NSString *fileName) {
    return  [[FQPathGetter applicationPath] filePathInDocumentPathForName:fileName];
}
NSString * UIResourceFile(NSString *fileName) {
    return  [[FQPathGetter applicationPath] filePathInResourcePathForName:fileName];
}
NSString * UILibaryFile(NSString *fileName) {
    return  [[FQPathGetter applicationPath] filePathInLibaryPathForName:fileName];
}
NSString * UITemporaryFile(NSString *fileName) {
    return  [[FQPathGetter applicationPath] filePathInTemporaryPathForName:fileName];
}
NSString * UIDocumentPath() {
    return  [[FQPathGetter applicationPath] documentPath];
}
NSString * UIResourcePath() {
    return  [[FQPathGetter applicationPath] resourcePath];
}
NSString * UILibaryPath() {
    return  [[FQPathGetter applicationPath] libaryPath];
}
NSString * UITemporaryPath() {
    return  [[FQPathGetter applicationPath] temporaryPath];
}
@end
