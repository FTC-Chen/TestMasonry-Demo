//
//  Masonry4ViewController.m
//  TestMasonry
//
//  Created by anyongxue on 2017/3/15.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "Masonry4ViewController.h"
#import <Masonry.h>
#import "UIView+Masonry.h"

@interface Masonry4ViewController ()

@end

@implementation Masonry4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[高级] 横向或者纵向等间隙的排列一组view
    
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

    
    //很遗憾 autoLayout并没有直接提供等间隙排列的方法(Masonry的官方demo中也没有对应的案例) 但是参考案例3 我们可以通过一个小技巧来实现这个目的 为此我写了一个Category
    
    //学习他人写法
    
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    [sview addSubview:sv11];
    [sview addSubview:sv12];
    [sview addSubview:sv13];
    [sview addSubview:sv21];
    [sview addSubview:sv31];
    
    
    //给予不同的大小 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [sview distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [sview distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
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
