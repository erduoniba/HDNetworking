//
//  HDHomeViewModel.m
//  HDNewHouseDemo
//
//  Created by denglibing on 2017/6/12.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import "HDHomeViewModel.h"

#import "HDRequestManagerConfig.h"

@implementation HDHomeViewModel

- (HDRequestMethod)hdRequestMethodType {
    return HDRequestMethodGet;
}

- (NSString *)hdRequestURL {
    return SHOWAPI_LAUGHTER;
}

- (void)hdRequestConfiguration:(HDRequestManagerConfig *)configuration {
    configuration.timeoutInterval = 5.0f;
    configuration.requestCachePolicy = HDRequestReturnCacheAndLoadToCache; //优先取缓存数据，不在请求网络数据
    configuration.resultCacheDuration = 10; //设置缓存时长为10秒
}

- (NSDictionary *)hdRequestParamters {
    NSMutableDictionary *paramter = [NSMutableDictionary dictionaryWithDictionary:[super hdRequestParamters]];
    paramter[@"page"] = @(_pageIndex);
    paramter[@"maxResult"] = @(_pageSize);
    return paramter;
}

- (NSString *)hdRequestIdentifier {
    //清除第二页的数据
    return @"page=2";
}

@end
