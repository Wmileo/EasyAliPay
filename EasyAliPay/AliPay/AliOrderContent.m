//
//  AliOrderModel.m
//  EasyAliPay
//
//  Created by ileo on 16/1/14.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import "AliOrderContent.h"
#import "Order.h"
#import "DataSigner.h"

@interface AliOrderContent()

@property (nonatomic, strong) Order *order;
@property (nonatomic, strong) NSString *privateKey;

@end

@implementation AliOrderContent

static NSDictionary *contents;

+(void)configForContentKey:(NSString *)contentKey WithOrderPartner:(NSString *)partner orderSeller:(NSString *)seller orderNotifyURL:(NSString *)notifyURL privateKey:(NSString *)privateKey appScheme:(NSString *)appScheme{
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.notifyURL = notifyURL;
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    AliOrderContent *content = [[AliOrderContent alloc] init];
    content.order = order;
    content.privateKey = privateKey;
    content.appScheme = appScheme;
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:contents];
    [dic setValue:content forKey:contentKey];
    contents = [dic copy];
}

+(AliOrderContent *)detailForContentKey:(NSString *)contentKey withTradeNO:(NSString *)tradeNO productName:(NSString *)productName productDescription:(NSString *)productDescription amount:(NSString *)amount{
    AliOrderContent *content = [contents valueForKey:contentKey];
    content.order.tradeNO = tradeNO;
    content.order.productName = productName;
    content.order.productDescription = productDescription;
    content.order.amount = amount;
    return content;
}

-(NSString *)rsaOrder{

    NSString *orderSpec = [self.order description];
    id<DataSigner> signer = CreateRSADataSigner(self.privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    NSString *orderString = nil;
    if (signedString) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",orderSpec,signedString,@"RSA"];
        return orderString;
    }
    
    return nil;
}

@end
