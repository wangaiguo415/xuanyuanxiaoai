//
//  CKRequestHandlerProtocol.h
//  ck
//
//  Created by Chin on 14/10/20.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FQHTTPRequestManager;
@protocol FQRequestHandlerProtocol <NSObject>
@required
- (void)requestStarted:(FQHTTPRequestManager *)request;
- (void)request:(FQHTTPRequestManager *)request progressScheduled:(float)progress;
- (void)request:(FQHTTPRequestManager *)request finished:(NSData *)responseData;
- (void)requestFailed:(FQHTTPRequestManager *)request;


- (BOOL)needsRecordProgress;
@end
