//
//  Masonry1ViewController.m
//  TestMasonry
//
//  Created by anyongxue on 2017/3/15.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "Masonry1ViewController.h"
#import <Masonry.h>

@interface Masonry1ViewController ()

@end

@implementation Masonry1ViewController

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
    
    
    //首先在Masonry中能够添加autolayout约束有三个函数
    
    //- (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block;
    //- (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block;
    //- (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block;
    
    /*
     mas_makeConstraints 只负责新增约束 Autolayout不能同时存在两条针对于同一对象的约束 否则会报错
     mas_updateConstraints 针对上面的情况 会更新在block中出现的约束 不会导致出现两个相同约束的情况
     mas_remakeConstraints 则会清除之前的所有约束 仅保留最新的约束
     三种函数善加利用 就可以应对各种情况了
     */
    
    //第二部分
    //其次 equalTo 和 mas_equalTo的区别在哪里呢? 其实 mas_equalTo是一个MACRO
    
    /*
     #define mas_equalTo(...)                 equalTo(MASBoxValue((__VA_ARGS__)))
     #define mas_greaterThanOrEqualTo(...)    greaterThanOrEqualTo(MASBoxValue((__VA_ARGS__)))
     #define mas_lessThanOrEqualTo(...)       lessThanOrEqualTo(MASBoxValue((__VA_ARGS__)))
     #define mas_offset(...)                  valueOffset(MASBoxValue((__VA_ARGS__)))
     */
    
    /*
    可以看到 mas_equalTo只是对其参数进行了一个BOX操作(装箱) MASBoxValue的定义具体可以看看源代码 太长就不贴出来了
    所支持的类型 除了NSNumber支持的那些数值类型之外 就只支持CGPoint CGSize UIEdgeInsets
    介绍完这几个问题 我们就继续往下了 PS:刚才定义的sv会成为我们接下来所有sample的superView
    */

    UIView *sView2 = [[UIView alloc] init];
    sView2.backgroundColor = [UIColor orangeColor];
    [sview addSubview:sView2];
    
    [sView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(sview).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        /* 等价于
         make.top.equalTo(sv).with.offset(10);
         make.left.equalTo(sv).with.offset(10);
         make.bottom.equalTo(sv).with.offset(-10);
         make.right.equalTo(sv).with.offset(-10);
         */
        
        /* 也等价于
         make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
         */
    }];
    
    /*
     可以看到 edges 其实就是top,left,bottom,right的一个简化 分开写也可以 一句话更省事
     
     那么为什么bottom和right里的offset是负数呢? 因为这里计算的是绝对的数值 计算的bottom需要小鱼sv的底部高度 所以要-10 同理用于right
     
     这里有意思的地方是and和with 其实这两个函数什么事情都没做
    
     - (MASConstraint *)with {
     return self;
     }
     
     - (MASConstraint *)and {
     return self;
     }
     */
   
    
    
    
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
