//
//  HDRequestManager.m
//  HDNewHouseDemo
//
//  Created by denglibing on 2017/6/12.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import "HDRequestManager.h"

#import "HDRequestManagerConfig.h"

#import "HDErrorDemo.h"

@interface HDRequestManager ()

@property (nonatomic, strong) HDRequestConvertManager *requestConvertManager;

@end

@implementation HDRequestManager

#pragma mark - 初始化管理
+ (instancetype)sharedInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.requestConvertManager = [HDRequestConvertManager sharedInstance];
        self.baseURL = SHOWAPI_BASEURL;

        [self initialConfig];
    }
    return self;
}

- (void)initialConfig {
    //通过configuration来设置请求头
    NSMutableDictionary *builtinHeaders = [NSMutableDictionary dictionary];
    builtinHeaders[@"showapi_appid"] = SHOWAPI_APPID;
    builtinHeaders[@"showapi_sign"] = SHOWAPI_SIGN;
    self.requestConvertManager.configuration.builtinHeaders = builtinHeaders;

    //通过configuration来设置通用的请求体
    NSMutableDictionary *builtinBodys = [NSMutableDictionary dictionary];
    builtinBodys[@"showapi_appid"] = SHOWAPI_APPID;
    builtinBodys[@"showapi_sign"] = SHOWAPI_SIGN;
    self.requestConvertManager.configuration.builtinBodys = builtinBodys;

    //添加我们需要的类型，接口返回的是 text/html
    [self.requestConvertManager.configuration.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

    [self.requestConvertManager setLoggerLevel:AFLoggerLevelInfo];
    self.requestConvertManager.configuration.HDError = [HDErrorDemo class];

    //通过configuration来统一处理输出的数据，比如对token失效处理、对需要重新登录拦截
    self.requestConvertManager.configuration.resposeHandle = ^id (NSURLSessionTask *dataTask, id responseObject) {
        return responseObject;
    };
}

- (void)setBaseURL:(NSString *)baseURL {
    _baseURL = baseURL;
    self.requestConvertManager.configuration.baseURL = baseURL;
}


#pragma mark - 缓存管理
- (void)clearRequestCache:(NSString *_Nullable)urlString {
    [_requestConvertManager clearRequestCache:urlString];
}

- (void)clearRequestCache:(NSString *_Nullable)urlString identifier:(NSString *_Nullable)identifier {
    [_requestConvertManager clearRequestCache:urlString identifier:identifier];
}

- (void)clearAllCache {
    [_requestConvertManager clearAllCache];
}


#pragma mark - 具体接口
- (void)laughterListPageIndex:(NSInteger)pageIndex
                     pageSize:(NSInteger)pageSize
                        cache:(HDRequestManagerCache _Nullable )cache
                      success:(HDRequestManagerSuccess _Nullable )success
                      failure:(HDRequestManagerSuccess _Nullable )failure {
    [self.requestConvertManager requestMethod:HDRequestMethodPost
                                    URLString:SHOWAPI_LAUGHTER
                                   parameters:@{@"page" : @(pageIndex), @"maxResult" : @(pageSize)}
                         configurationHandler:^(HDRequestManagerConfig * _Nullable configuration) {
                             configuration.resultCacheDuration = 100000;    //设置缓存时长为100000秒
                             configuration.requestCachePolicy = HDRequestReturnLoadToCache;    //优先取缓存数据，不在请求网络数据
                         } cache:^(id  _Nullable responseObject) {
                             NSLog(@"缓存数据");
                             cache(responseObject);
                         } success:^(NSURLSessionTask * _Nullable dataTask, id  _Nullable responseObject) {
                             success(dataTask, responseObject);
                         } failure:^(NSURLSessionTask * _Nullable dataTask, HDError * _Nullable error) {
                             failure(dataTask, error);
                         }];
}

@end
