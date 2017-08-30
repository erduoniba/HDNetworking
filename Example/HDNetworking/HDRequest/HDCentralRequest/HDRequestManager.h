//
//  HDRequestManager.h
//  HDNewHouseDemo
//
//  Created by denglibing on 2017/6/12.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <HDNetworking/HDNetworking.h>
#import "HDRequest.h"

/**
 集中式的API处理，项目中所有的接口都在此类集中处理，方便接口管理及统一配置
 */
@interface HDRequestManager : NSObject

+ (instancetype _Nullable )sharedInstance;

@property (nonatomic, strong) NSString * _Nullable baseURL;

/**
 清除指定本地的网络缓存数据

 @param urlString 网络请求的url，删除该urlString下所有的缓存（无视parameters参数）
 */
- (void)clearRequestCache:(NSString *_Nullable)urlString;

/**
 清除指定本地的网络缓存数据
 @param urlString 网络请求的url
 @param identifier 该次请求的唯一表示id，比如楼盘id、个人信息id （可以不写，则删除该urlString下所有的缓存（无视parameters参数））
 */
- (void)clearRequestCache:(NSString *_Nullable)urlString identifier:(NSString *_Nullable)identifier;

/**
 清除所有本地的网络缓存数据
 */
- (void)clearAllCache;

#pragma mark - 具体接口名

- (void)laughterListPageIndex:(NSInteger)pageIndex
                     pageSize:(NSInteger)pageSize
                      success:(HDRequestManagerSuccess _Nullable )success
                      failure:(HDRequestManagerSuccess _Nullable )failure;

@end
