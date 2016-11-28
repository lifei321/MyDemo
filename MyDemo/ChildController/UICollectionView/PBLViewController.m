//
//  PBLViewController.m
//  MyDemo
//
//  Created by ShanCheli on 16/11/28.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "PBLViewController.h"
#import "UICollectionViewSimpleController.h"
#import "WaterViewController.h"
#import "OtherWaterViewController.h"
#import "EasyWaterViewController.h"


@interface PBLViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *titleArr;


@end

@implementation PBLViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.tableView];
    
    self.titleArr = @[@"UICollectionView基础使用", @"瀑布流", @"另一种简单瀑布流",@"简单方式的瀑布流（推荐）"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            UICollectionViewSimpleController *ctr = [[UICollectionViewSimpleController alloc] init];
            ctr.view.backgroundColor = [UIColor whiteColor];
            ctr.title = self.titleArr[indexPath.row];
            [self.navigationController pushViewController:ctr animated:YES];
        }
            
            break;
        case 1:{
            WaterViewController *ctr = [[WaterViewController alloc] init];
            ctr.view.backgroundColor = [UIColor whiteColor];
            ctr.title = self.titleArr[indexPath.row];
            [self.navigationController pushViewController:ctr animated:YES];
        }
            
            break;
        case 2:{
            OtherWaterViewController *ctr = [[OtherWaterViewController alloc] init];
            ctr.view.backgroundColor = [UIColor whiteColor];
            ctr.title = self.titleArr[indexPath.row];
            [self.navigationController pushViewController:ctr animated:YES];
            
        }
            break;

        case 3:{
            EasyWaterViewController *ctr = [[EasyWaterViewController alloc] init];
            ctr.view.backgroundColor = [UIColor whiteColor];
            ctr.title = self.titleArr[indexPath.row];
            [self.navigationController pushViewController:ctr animated:YES];
            
        }
    }
}
@end
