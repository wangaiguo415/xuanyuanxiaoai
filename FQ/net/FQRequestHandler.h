//
//  CKHTTPRequestManager.h
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#import "FQRequestHandlerProtocol.h"


@class FQHTTPRequestManager;
@interface FQRequestHandler : NSObject<FQRequestHandlerProtocol>
{
    
}


- (id)initWithView:(UIView *)view serializeObjectClass:(Class)cls;

+ (id)handlerForView:(UIView *)view class:(Class)cls;
+ (id)backgroundHandler:(Class)cls;
+ (id)defaultHandler:(Class)cls;
+ (id)handlerNoLoading:(Class)cls;


@property (nonatomic,assign)BOOL showLoadingWhileLoad;
@property (nonatomic,assign)BOOL showTipsWhenFailed;
@property (nonatomic,assign)BOOL showTipsWhenError;


@property (nonatomic,assign)BOOL dismissLoadingAutomaticly;

@property (nonatomic,assign)float failedTipsTimeInterval;
@property (nonatomic,assign)float errorTipsTimeInterval;

@property (nonatomic,strong)Class  classToSerializeObject;
@property (nonatomic,weak) UIView  *viewWillShowHud;

@property (nonatomic,weak)AFHTTPRequestOperation  *currentOperation;

@property (nonatomic,copy)void(^didStarted)(FQHTTPRequestManager *manager);
@property (nonatomic,copy)void(^didFinished)(FQHTTPRequestManager *manager,id data);
@property (nonatomic,copy)void(^onProgress)(FQHTTPRequestManager *manager,float progress);
@property (nonatomic,copy)void(^didFailed)(FQHTTPRequestManager *manager);


@property (nonatomic,strong,readonly)id responseObj;


@end
