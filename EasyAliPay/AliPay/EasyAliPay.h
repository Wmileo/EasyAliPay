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

+(void)payAliOrderContent:(AliOrderContent *)content callBack:(void (^)(BOOL success, NSDictionary *result))callBack;

+(void)appOpenURL:(NSURL *)url callBack:(void (^)(BOOL success, NSDictionary *result))callBack;

@end
