//
//  Masonry2ViewController.m
//  TestMasonry
//
//  Created by anyongxue on 2017/3/15.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "Masonry2ViewController.h"
#import <Masonry.h>

@interface Masonry2ViewController ()

@end

@implementation Masonry2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //第一部分
    self.view.backgroundColor = [UIColor whiteColor];
    
    WS(weakSelf);
    
    UIView *sview= [UIView new];
    sview.backgroundColor = [UIColor lightGrayColor];
    //在做autoLayout之前 一定要先将view添加到superview上 否则会报错
    [self.view addSubview:sview];
    //mas_makeConstraints就是Masonry的autolayout添加函数 将所需的约束添加到block中行了
    [sview mas_makeConstraints:^(MASConstraintMaker *make) {
        //将sv居中
        make.center.equalTo(weakSelf.view);
        //将size设置成(300,300)
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIView *sview2 = [UIView new];
    sview2.backgroundColor = [UIColor orangeColor];
    [sview addSubview:sview2];
    
    UIView *sview3 = [UIView new];
    sview3.backgroundColor = [UIColor redColor];
    [sview addSubview:sview3];
    
    int padding1 = 10;
    
    [sview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sview.mas_centerY);
        make.left.equalTo(sview.mas_left).with.offset(padding1);
        make.right.equalTo(sview3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sview3);
    }];
    
    [sview3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sview.mas_centerY);
        make.left.equalTo(sview2.mas_right).with.offset(padding1);
        make.right.equalTo(sview.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sview2);
    }];

    //这里我们在两个子view之间互相设置的约束 可以看到他们的宽度在约束下自动的被计算出来了
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
