//
//  EasyAliPay.h
//  EasyAliPay
//
//  Created by ileo on 16/1/13.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AliOrderContent.h"

@interface EasyAliPay : NSObject


/**
 *  跳转支付宝支付
 *
 *  @param content  订单内容
 *  @param callBack 支付回调
 */
+(void)payAliOrderContent:(AliOrderContent *)content callBack:(void (^)(BOOL success, NSDictionary *result))callBack;


/**
 *  AppDelegate 用于接收支付宝打开APP时的数据
 *
 *  @param url      回调URL
 *  @param callBack 支付回调
 */
+(void)appOpenURL:(NSURL *)url callBack:(void (^)(BOOL success, NSDictionary *result))callBack;

@end
