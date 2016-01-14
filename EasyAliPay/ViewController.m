//
//  ViewController.m
//  EasyAliPay
//
//  Created by ileo on 16/1/13.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import "ViewController.h"
#import "EasyAliPay.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)click{
    
    [AliOrderContent configForContentKey:@"test" WithOrderPartner:@"" orderSeller:@"" orderNotifyURL:@"" privateKey:@"" appScheme:@"test"];
    
    [EasyAliPay payAliOrderContent:[AliOrderContent detailForContentKey:@"test" withTradeNO:@"" productName:@"测试" productDescription:@"测试" amount:@"0.01"] callBack:^(BOOL success,NSDictionary *result) {
        NSLog(@"%@",result);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
