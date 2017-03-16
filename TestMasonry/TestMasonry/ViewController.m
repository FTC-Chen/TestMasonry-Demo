//
//  ViewController.m
//  TestMasonry
//
//  Created by anyongxue on 2017/3/15.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "ViewController.h"
#import "Masonry1ViewController.h"
#import "Masonry2ViewController.h"
#import "Masonry3ViewController.h"
#import "Masonry4ViewController.h"
#import "Masonry5ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *masonryTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建tableView
    [self.view addSubview:self.masonryTableView];
}


- (UITableView *)masonryTableView{
    
    if (!_masonryTableView) {
        
        _masonryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
        
        [_masonryTableView setDelegate:self];
        
        [_masonryTableView setDataSource:self];
        
        [_masonryTableView setTableFooterView:[UIView new]];
        
        _masonryTableView.backgroundColor = KVIEWBGColor;
    }
    
    return _masonryTableView;
}

#pragma mark - TabelViewDelegate && DataSoure -
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell01";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"简单superView";
        
    }else if (indexPath.row == 1){
        
        cell.textLabel.text = @"初级superview";
    
    }else if (indexPath.row == 2){
        
        cell.textLabel.text = @"中级ScrollView";
    
    }else if (indexPath.row == 3){
        
        cell.textLabel.text = @"高级ScrollView";
    
    }else if (indexPath.row == 4){
        
        cell.textLabel.text = @"其它测试";
    }

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        //测试属性
        Masonry1ViewController *masonry1 = [[Masonry1ViewController alloc] init];
        
        [self.navigationController pushViewController:masonry1 animated:YES];
    
    }else if (indexPath.row == 1){
        //初级
        Masonry2ViewController *masonry2 = [[Masonry2ViewController alloc] init];
        
        [self.navigationController pushViewController:masonry2 animated:YES];

    }else if (indexPath.row == 2){
        //初级
        Masonry3ViewController *masonry3 = [[Masonry3ViewController alloc] init];
        
        [self.navigationController pushViewController:masonry3 animated:YES];
        
    }else if (indexPath.row == 3){
        //初级
        Masonry4ViewController *masonry4 = [[Masonry4ViewController alloc] init];
        
        [self.navigationController pushViewController:masonry4 animated:YES];
        
    }else if (indexPath.row == 4){
        //初级
        Masonry5ViewController *masonry5 = [[Masonry5ViewController alloc] init];
        
        [self.navigationController pushViewController:masonry5 animated:YES];
        
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
