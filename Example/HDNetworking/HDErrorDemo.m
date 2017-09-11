//
//  HDErrorDemo.m
//  HDNetworking
//
//  Created by 邓立兵 on 2017/9/11.
//  Copyright © 2017年 midea-smart. All rights reserved.
//

#import "HDErrorDemo.h"

@implementation HDErrorDemo

+ (HDError *)hdErrorNetNotReachable {
    HDError *hdError = [HDError new];
    hdError.errorCode = @"999999";
    hdError.errorMessage = @"当前暂无网络";
    hdError.errorMessageDescription = @"AFNetwork监测当前暂无网络";
    return hdError;
}

+ (HDError *)hdErrorHttpError:(NSError *)error {
    HDError *hdError = [HDError new];
    hdError.errorCode = [NSString stringWithFormat:@"%d", (int)error.code];
    hdError.errorMessage = error.localizedDescription;
    hdError.errorMessageDescription = error.localizedDescription;
    return hdError;
}

@end
