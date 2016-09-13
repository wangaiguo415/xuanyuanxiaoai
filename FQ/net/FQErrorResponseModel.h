//
//  CKErrorResponseModel.h
//  ck
//
//  Created by 范文青 on 15/10/26.
//  Copyright © 2015年 chin. All rights reserved.
//

#import "FQResponseModel.h"

@interface FQErrorResponseModel : FQResponseModel
@property (nonatomic, strong) NSString *data;
@property (nonatomic, assign) NSInteger code;
@end
