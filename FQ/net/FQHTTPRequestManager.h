//
//  CKHTTPRequestManager.h
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FQRequestHandler.h"
#import "FQRequestModel.h"
@class AFHTTPRequestOperation;
@protocol AFMultipartFormData;
@interface FQHTTPRequestManager : NSObject
{
    
}
+ (FQHTTPRequestManager *)manager:(NSString *)urlString handler:(FQRequestHandler *)handler requestObject:(FQRequestModel *)obj;

@property (nonatomic,strong)NSString  *urlString;
@property (nonatomic,strong)FQRequestHandler  *handler;
@property (nonatomic,strong)FQRequestModel   *requestObject;

@property (nonatomic,readonly)AFHTTPRequestOperation  *currentOperation;
@property (nonatomic,assign) NSInteger tag;

@property (nonatomic,assign)BOOL synchronize;

- (void)get;
- (void)post;
- (void)post:(void (^)(id <AFMultipartFormData> formData))block;
@end
