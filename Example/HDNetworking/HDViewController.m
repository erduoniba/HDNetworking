//
//  HDViewController.m
//  HDNetworking
//
//  Created by midea-smart on 08/28/2017.
//  Copyright (c) 2017 midea-smart. All rights reserved.
//

#import "HDViewController.h"

#import "HDRequestManager.h"

#import "HDHomeViewModel.h"

@interface HDViewController ()

@property (nonatomic, assign) BOOL useDispersedCache;

@property (nonatomic, strong) HDHomeViewModel *dRequest;

@property (nonatomic, strong) HDRequestManager *cRequest;

@end

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _useDispersedCache = NO;

    _dRequest = [HDHomeViewModel new];
    _dRequest.pageSize = 20;
    
    _cRequest = [HDRequestManager sharedInstance];
}

- (IBAction)centralRequest:(id)sender {
    [_cRequest laughterListPageIndex:random() % 3
                            pageSize:20
                               cache:^(id  _Nullable responseObject) {

                               } success:^(NSURLSessionTask * _Nullable httpbase, id  _Nullable responseObject) {

                               } failure:^(NSURLSessionTask * _Nullable httpbase, id  _Nullable responseObject) {
                                   
                               }];
}

- (IBAction)dispersedRequest:(id)sender {
    _dRequest.pageIndex = random() % 3;
    [_dRequest requestCache:^(id  _Nullable responseObject) {
        NSLog(@"cache");
    } success:^(NSURLSessionTask * _Nullable httpbase, id  _Nullable responseObject) {
        NSLog(@"success");
    } failure:^(NSURLSessionTask * _Nullable httpbase, id  _Nullable responseObject) {
        NSLog(@"failure");
    }];
}

- (IBAction)clearCache:(id)sender {
    if (_useDispersedCache) {
        [_dRequest clearAllCache];
    }
    else {
        [_cRequest clearAllCache];
    }
}

- (IBAction)clearCacheUrl:(id)sender {
    if (_useDispersedCache) {
        [_dRequest clearRequestUrlCache];
    }
    else {
        [_cRequest clearRequestCache:SHOWAPI_LAUGHTER];
    }
}

- (IBAction)clearCacheUrlId:(id)sender {
    if (_useDispersedCache) {
        [_dRequest clearRequestUrlAndFormulateCache];
    }
    else {
        [_cRequest clearRequestCache:SHOWAPI_LAUGHTER identifier:@"page=2"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
