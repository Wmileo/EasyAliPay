//
//  AliOrderModel.h
//  EasyAliPay
//
//  Created by ileo on 16/1/14.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AliOrderContent : NSObject

/**
 *  配置订单基本信息
 *
 *  @param contentKey 订单的类型识别key
 *  @param partner    partner
 *  @param seller     seller
 *  @param notifyURL  notifyURL
 *  @param privateKey privateKey
 *
 */
+(void)configForContentKey:(NSString *)contentKey
          WithOrderPartner:(NSString *)partner
               orderSeller:(NSString *)seller
            orderNotifyURL:(NSString *)notifyURL
                privateKey:(NSString *)privateKey
                 appScheme:(NSString *)appScheme;



/**
 *  生成订单详细信息
 *
 *  @param contentKey         订单的类型识别key
 *  @param tradeNO            tradeNO 订单号
 *  @param productName        productName
 *  @param productDescription productDescription
 *  @param amount             amount 金额
 *
 */
+(AliOrderContent *)detailForContentKey:(NSString *)contentKey
                            withTradeNO:(NSString *)tradeNO
                            productName:(NSString *)productName
                     productDescription:(NSString *)productDescription
                                 amount:(NSString *)amount;

/**
 *  加密订单信息
 */
@property (nonatomic, readonly) NSString *rsaOrder;

/**
 *  用于支付宝跳转回app    (info.plist)
 */
@property (nonatomic, copy) NSString *appScheme;

@end
