//
//  Masonry3ViewController.m
//  TestMasonry
//
//  Created by anyongxue on 2017/3/15.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "Masonry3ViewController.h"
#import <Masonry.h>

@interface Masonry3ViewController ()

@end

@implementation Masonry3ViewController

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

    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    [sview addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sview).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];

    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
   
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    
    int count = 10;
    UIView *lastView = nil;
    
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        //指定HSB，参数是：色调（hue），饱和的（saturation），亮度（brightness）
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if ( lastView ){
                make.top.mas_equalTo(lastView.mas_bottom);
            }else{
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
    
    /*
     从scrollView的scrollIndicator可以看出 scrollView的内部已如我们所想排列好了
     这里的关键就在于container这个view起到了一个中间层的作用 能够自动的计算uiscrollView的contentSize
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
