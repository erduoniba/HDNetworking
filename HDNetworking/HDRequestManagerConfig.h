//
//  HDRequestManagerConfig.h
//  HDNewHouseDemo
//
//  Created by denglibing on 2017/6/9.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<AFNetworking/AFNetworking.h>)
    #import <AFNetworking/AFNetworking.h>
#else
    #import "AFNetworking.h"
#endif

extern const CGFloat HDRequestTimeoutInterval;

/**
 请求配置类，比如设置baseURL，request、response、timeout、请求的头部通用配置、缓存配置、数据做统一的处理
 */
@interface HDRequestManagerConfig : NSObject

@property (nonatomic, copy) NSString *baseURL;

/**
 *  请求的一些配置（默认不变的信息），比如：缓存机制、请求超时、请求头信息等配置
 */
@property (nonatomic, strong) AFHTTPRequestSerializer *requestSerializer;

/**
 *  对返回的数据进行序列化，默认使用 AFHTTPResponseSerializer，支持AFJSONResponseSerializer、AFXMLParserResponseSerializer、AFXMLDocumentResponseSerializer等
 */
@property (nonatomic, strong) AFHTTPResponseSerializer *responseSerializer;

/**
 请求的头部通用配置
 */
@property (nonatomic, strong) NSMutableDictionary *builtinHeaders;

/**
 请求体通用配置
 */
@property (nonatomic, strong) NSMutableDictionary *builtinBodys;

/**
 请求超时时间设置，默认15秒
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 如果 <= 0，表示不启用缓存。单位为秒，表示对于一个请求的结果缓存多长时间
 */
@property (nonatomic, assign) NSInteger resultCacheDuration;

/**
 优先取本地缓存，如果缓存时间过期则重新请求，默认NO
 */
@property (nonatomic, assign) BOOL requestPriorityCache;


/**
 对请求返回的数据做统一的处理，比如token失效、重新登录等等操作。
 */
@property (nonatomic, copy) id (^ resposeHandle)(NSURLSessionTask *dataTask, id responseObject);

@end
