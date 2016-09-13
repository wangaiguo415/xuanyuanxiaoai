//
//  CKHTTPRequestManager.m
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//
#import "FQRequestHandler.h"
#import "FQHTTPRequestManager.h"
#import <MJExtension/MJExtension.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "FQErrorResponseModel.h"

@interface FQRequestHandler () {
    MBProgressHUD  *_loadingHud;
}
@end
@implementation FQRequestHandler

+ (id)handlerForView:(UIView*)view class:(Class)cls
{
    return [[[self class] alloc] initWithView:view serializeObjectClass:cls];
}

+ (id)backgroundHandler:(Class)cls
{
    FQRequestHandler* handler = [self handlerForView:nil class:cls];
    [handler setShowLoadingWhileLoad:NO];
    [handler setShowTipsWhenError:NO];
    [handler setShowTipsWhenFailed:NO];
    return handler;
}

+ (id)defaultHandler:(Class)cls
{
    return [self handlerForView:nil class:cls];
}

+ (id)handlerNoLoading:(Class)cls
{
    FQRequestHandler* handler = [self handlerForView:nil class:cls];
    [handler setShowLoadingWhileLoad:NO];
    [handler setShowTipsWhenError:YES];
    [handler setShowTipsWhenFailed:YES];
    return handler;
}

- (float)defaultErrorTimeInterval
{
    return 0.6f;
}

- (float)defaultFailedTimeInterval
{
    return 0.6f;
}
- (id)initWithView:(UIView*)view serializeObjectClass:(Class)cls
{
    self = [super init];
    if (self) {
        _viewWillShowHud = view;
        _classToSerializeObject = cls;
        _showLoadingWhileLoad = YES;
        _showTipsWhenError = YES;
        _showTipsWhenFailed = YES;
        _dismissLoadingAutomaticly = YES;

        _errorTipsTimeInterval = [self defaultErrorTimeInterval];
        _failedTipsTimeInterval = [self defaultFailedTimeInterval];
    }
    return self;
}

- (void)showLoading
{
    if (_loadingHud == nil)
    {
        _loadingHud = [MBProgressHUD showHUDAddedTo:MAIN_WINDOW animated:YES];
        [_loadingHud setRemoveFromSuperViewOnHide:YES];
    }
    if (_loadingHud.superview == nil)
    {
        [_loadingHud show:YES];
    }
}
- (void)dismissLoading:(BOOL)animated
{
    [_loadingHud hide:animated];
}

- (UIView*)viewWillShowHud
{
    if (_viewWillShowHud != nil)
    {
        return _viewWillShowHud;
    }
    return MAIN_WINDOW;
}

    
- (void)requestStarted:(FQHTTPRequestManager*)request
{
    if (_showLoadingWhileLoad) {
        [self showLoading];
    }
    if (_didStarted) {
        _didStarted(request);
    }
}

- (void)request:(FQHTTPRequestManager*)request progressScheduled:(float)progress
{
    if (_onProgress) {
        _onProgress(request, progress);
    }
}
- (void)request:(FQHTTPRequestManager*)request finished:(NSData*)responseData
{
    id jsonObject = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    if ([[jsonObject objectForKey:@"code"] integerValue] != 200) {
        [self requestFailed:request];
        return;
    }
    NSString* errorMes = nil;
    id result;
    if (_classToSerializeObject == nil || [self.classToSerializeObject isSubclassOfClass:[NSData class]]) {
        result = responseData;
    }
    else if ([_classToSerializeObject isSubclassOfClass:[NSString class]]) {
        result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    }
    else {
        if ([_classToSerializeObject isSubclassOfClass:[NSDictionary class]] || [_classToSerializeObject isSubclassOfClass:[NSArray class]]) {
            result = jsonObject;
        }
        else {
            result = [_classToSerializeObject mj_objectWithKeyValues:jsonObject];
            if (result == nil) {
                errorMes = NSLocalizedString(@"error_data_format", nil);
            }
        }
    }
    _responseObj = result;

    if (_dismissLoadingAutomaticly) {
        [_loadingHud hide:NO];
    }

    if (_showTipsWhenError && errorMes != nil) {
        if (errorMes.length == 0) {
            errorMes = NSLocalizedString(@"error_server_error", nil);
        }
        [self showMessage:errorMes];
    }
    if (_didFinished) {
        _didFinished(request, result);
    }
}

- (void)requestFailed:(FQHTTPRequestManager*)request
{
    NSLog(@"%@",request.currentOperation.responseString);
    if ([request.urlString rangeOfString:@"file_preview"].location != NSNotFound) {
        if (_didFinished) {
            _didFinished(request,request.currentOperation.responseData);
        }
        return;
    }
    if (_didFailed) {
        _didFailed(request);
    }
    if (request.currentOperation.isCancelled) {
        return;
    }
    //dismiss dialog
    [MBProgressHUD hideAllHUDsForView:MAIN_WINDOW animated:YES];
    
    if (_showTipsWhenFailed) {
        if (request.currentOperation.response.statusCode == 0) {
            [self showMessage:@"网络连接失败"];
        }
        else {
           //错误处理
            id jsonObject = [NSJSONSerialization JSONObjectWithData:request.currentOperation.responseData options:NSJSONReadingMutableContainers error:nil];
            if (jsonObject == nil) {
                [self showMessage:@"服务器内部错误"];
            }else{
                FQErrorResponseModel *model = [FQErrorResponseModel mj_objectWithKeyValues:jsonObject];
                [self showMessage:model.data];
            }
        }
    }

}


- (void)showMessage:(NSString*)message
{
    [_loadingHud hide:NO];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:MAIN_WINDOW animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}
    
- (BOOL)needsRecordProgress
{
    if (_onProgress)
    {
        return YES;
    }
    return NO;
}

@end
