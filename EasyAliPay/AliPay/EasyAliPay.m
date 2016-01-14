//
//  EasyAliPay.m
//  EasyAliPay
//
//  Created by ileo on 16/1/13.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import "EasyAliPay.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation EasyAliPay

+(void)payAliOrderContent:(AliOrderContent *)content callBack:(void (^)(BOOL, NSDictionary *))callBack{
    [[AlipaySDK defaultService] payOrder:content.rsaOrder fromScheme:content.appScheme callback:^(NSDictionary *resultDic) {
        [EasyAliPay dealWithResultDic:resultDic callBack:callBack];
    }];
}

+(void)appOpenURL:(NSURL *)url callBack:(void (^)(BOOL, NSDictionary *))callBack{
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            [EasyAliPay dealWithResultDic:resultDic callBack:callBack];
        }];
    }
}

+(void)dealWithResultDic:(NSDictionary *)resultDic callBack:(void (^)(BOOL success, NSDictionary *result))callBack{
    if ([resultDic[@"resultStatus"] isEqualToString:@"9000"]) {
        NSArray *arr = [resultDic[@"result"] componentsSeparatedByString:@"&"];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:arr.count];
        for (NSString *param in arr) {
            NSArray *kv = [param componentsSeparatedByString:@"="];
            if (kv.count > 1) {
                NSString *key = kv[0];
                NSString *value = [param substringFromIndex:key.length + 2];
                value = [value substringToIndex:value.length - 1];
                [dic setObject:value forKey:key];
            }
        }
        if (callBack) {
            callBack(YES,[dic copy]);
        }
    }else{
        if (callBack) {
            callBack(NO,nil);
        }
    }
}

@end
