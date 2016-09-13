//
//  CKHTTPRequestManager.m
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import "FQHTTPRequestManager.h"
#import "AFHTTPRequestOperationManager.h"
#import <MJExtension/MJExtension.h>

@interface FQHTTPRequestManager ()
@property (nonatomic, strong) AFHTTPRequestOperation* currentOperation;
@property (nonatomic, assign) BOOL isFinished;
@end

@implementation FQHTTPRequestManager
AFHTTPRequestOperationManager* defaultRequestManager;
- (AFHTTPRequestOperationManager*)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultRequestManager = [AFHTTPRequestOperationManager manager];
        AFHTTPResponseSerializer* responseSerializer = [AFHTTPResponseSerializer serializer];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
        AFHTTPRequestSerializer* requestSerializer = [AFHTTPRequestSerializer serializer];
        [requestSerializer setTimeoutInterval:30];
        [defaultRequestManager setRequestSerializer:requestSerializer];
        [defaultRequestManager setResponseSerializer:responseSerializer];
        [defaultRequestManager.operationQueue setMaxConcurrentOperationCount:4];
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [securityPolicy setValidatesDomainName:NO];
        securityPolicy.allowInvalidCertificates = YES;
        defaultRequestManager.securityPolicy = securityPolicy;
    });
    return defaultRequestManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _synchronize = NO;
    }
    return self;
}
+ (FQHTTPRequestManager*)manager:(NSString*)urlString handler:(FQRequestHandler*)handler requestObject:(FQRequestModel*)obj
{
    FQHTTPRequestManager* manager = [[FQHTTPRequestManager alloc] init];
    [manager setHandler:handler];
    [manager setUrlString:urlString];
    [manager setRequestObject:obj];
    return manager;
}
- (void)setCurrentOperation:(AFHTTPRequestOperation*)currentOperation
{
    _currentOperation = currentOperation;
    [_handler setCurrentOperation:_currentOperation];
}
- (void)get
{
    [self valid:^{
        [_handler requestStarted:self];
        self.currentOperation = [[self defaultManager] GET:_urlString
            parameters:[self getParams]
            success:^(AFHTTPRequestOperation* operation, id responseObject) {
                [_handler request:self finished:responseObject];
                _isFinished = YES;
            }
            failure:^(AFHTTPRequestOperation* operation, NSError* error) {
                [_handler requestFailed:self];
                _isFinished = YES;
            }];
        [self deal];
    }];
}
- (void)post
{
    [self valid:^{
        [_handler requestStarted:self];
        self.currentOperation = [[self defaultManager] POST:_urlString
            parameters:[self getParams]
            success:^(AFHTTPRequestOperation* operation, id responseObject) {

                [_handler request:self finished:responseObject];
                _isFinished = YES;
            }
            failure:^(AFHTTPRequestOperation* operation, NSError* error) {
                [_handler requestFailed:self];
                _isFinished = YES;
            }];
        [self deal];
    }];
}
- (void)post:(void (^)(id<AFMultipartFormData> formData))block
{
    [self valid:^{
        [_handler requestStarted:self];
        self.currentOperation = [[self defaultManager] POST:_urlString
            parameters:[self getParams]
            constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                block(formData);
            }
            success:^(AFHTTPRequestOperation* operation, id responseObject) {
                [_handler request:self finished:responseObject];
                _isFinished = YES;
            }
            failure:^(AFHTTPRequestOperation* operation, NSError* error) {
                [_handler requestFailed:self];
                _isFinished = YES;
            }];
        [self deal];
    }];
}
- (NSDictionary*)getParams
{
    NSMutableDictionary* paramDic = [_requestObject mj_keyValues];
    if (paramDic == nil) {
        paramDic = [NSMutableDictionary dictionary];
    }
    return paramDic;
}
- (void)deal{
    if (_synchronize) {
        [self.currentOperation waitUntilFinished];
    }
    [self setOnProgress];
}
- (void)setOnProgress
{
    __weak FQRequestHandler* handler = _handler;
    __weak FQHTTPRequestManager* me = self;
    if ([_handler needsRecordProgress]) {
        [_currentOperation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
            [handler request:me progressScheduled:bytesRead / totalBytesExpectedToRead];
        }];
    }
}
- (void)valid:(void (^)())isValid
{
    if (_urlString.length == 0) {
        return;
    }
    _isFinished = NO;
    if (isValid) {
        isValid();
    }
}

@end
