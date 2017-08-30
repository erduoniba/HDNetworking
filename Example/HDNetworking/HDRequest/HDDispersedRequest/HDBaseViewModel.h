//
//  HDBaseViewModel.h
//  HDNewHouseDemo
//
//  Created by denglibing on 2017/6/12.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <HDNetworking/HDNetworking.h>
#import "HDRequest.h"

@class HDRequestManagerConfig;

@protocol HDBaseViewModelProtocol <NSObject>

/**
 请求的URL，已经添加baseURL

 @return 请求的URL，已经添加baseURL
 */
- (NSString *)hdRequestURL;

@optional
/**
 请求的方法，默认是GET

 @return 请求的方法，默认是GET
 */
- (HDRequestMethod)hdRequestMethodType;

/**
 请求的参数

 @return 请求的参数，默认返回通用的参数
 */
- (NSDictionary *)hdRequestParamters;


/**
 缓存数据的惟一标示，用于清除缓存，一般使用id=123456形式

 @return 缓存数据的惟一标示
 */
- (NSString *)hdRequestIdentifier;

/**
 请求的一些配置，子类初始化的时候会做统一的配置，子类需要特殊需要实现该协议

 @param configuration 请求的一些配置
 */
- (void)hdRequestConfiguration:(HDRequestManagerConfig *)configuration;

@end

/**
 分布式处理网络请求，该类做为父类，提供公共部分及抽象方法，处于MVVM中的VM层
 */
@interface HDBaseViewModel : NSObject <HDBaseViewModelProtocol>

@property (nonatomic, strong) NSString *baseURL;

@property (nonatomic, strong, readonly) HDRequestManagerConfig *configuration;

- (void)start;
- (void)canncel;

/**
 清除该url下所有的缓存数据，例如该方法可以清除所有商品详情下的缓存
 */
- (void)clearRequestUrlCache;

/**
 清除该url下，指定的缓存数据，例如该方法可以清除商品详情id=123456的缓存数据
 */
- (void)clearRequestUrlAndFormulateCache;

/**
 清除网络缓存的所有数据
 */
- (void)clearAllCache;

@end
