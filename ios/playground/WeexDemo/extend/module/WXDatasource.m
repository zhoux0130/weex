//
//  WXDatasource.m
//  WeexDemo
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 taobao. All rights reserved.
//

#import "WXDatasource.h"

@implementation WXDatasource

WX_EXPORT_METHOD(@selector(request:callback:))

- (void)request:(NSDictionary *)param callback:(WXModuleCallback)callback{
    //TODO:通过反射调用本地的创建保存方法
    NSLog(@"我被执行了");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        callback(nil);
        
    });
}


@end
