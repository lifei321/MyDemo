//
//  ViewController.m
//  MyDemo
//
//  Created by ShanCheli on 16/10/19.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "ViewController.h"
#import "cellModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeTableView];
    
    self.dataSource = [NSMutableArray new];
    
    cellModel *model1 = [cellModel cellModelWithName:@"cookie--cookie的存取和用法" controller:@"CookieController"];
    
    cellModel *model2 = [cellModel cellModelWithName:@"search--各种搜索方式设置" controller:@"PYSearchExampleController"];

    cellModel *model3 = [cellModel cellModelWithName:@"手势解锁" controller:@"UNlockViewController"];

    cellModel *model4 = [cellModel cellModelWithName:@"collection基本上使用和高级瀑布流" controller:@"PBLViewController"];

    cellModel *model5 = [cellModel cellModelWithName:@"文字折叠" controller:@"WenziZhedieTableViewController"];

    cellModel *model6 = [cellModel cellModelWithName:@"物流轴线" controller:@"LogisticsInfoViewController"];

    cellModel *model7 = [cellModel cellModelWithName:@"选择城市 区、县" controller:@"SelectCityViewController"];

    [self.dataSource addObject:model1];
    [self.dataSource addObject:model2];
    [self.dataSource addObject:model3];
    
    [self.dataSource addObject:model4];
    [self.dataSource addObject:model5];
    [self.dataSource addObject:model6];
    [self.dataSource addObject:model7];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cellModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.cellName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    cellModel *model = self.dataSource[indexPath.row];

    UIViewController *vc = [[NSClassFromString(model.pushController) alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)makeTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.tableView];
}


@end
