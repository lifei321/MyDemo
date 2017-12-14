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
    
    cellModel *model8 = [cellModel cellModelWithName:@"选择器PickerView" controller:@"PickerViewController"];

    cellModel *model9 = [cellModel cellModelWithName:@"APP启动检测升级" controller:@"CheckVersionViewController"];

    cellModel *model10 = [cellModel cellModelWithName:@"滚动新闻条" controller:@"ScrollNewsViewController"];

    cellModel *model11 = [cellModel cellModelWithName:@"自动下拉列表和tag标签自动排布" controller:@"MenuAndTagViewController"];

    cellModel *model12 = [cellModel cellModelWithName:@"标签控制列表" controller:@"TagSelectViewController"];

    cellModel *model13 = [cellModel cellModelWithName:@"两种下拉列表样式" controller:@"DropDownListController"];
    
    cellModel *model14 = [cellModel cellModelWithName:@"倒计时" controller:@"CountDownTimerController"];

    cellModel *model15 = [cellModel cellModelWithName:@"视频播放器" controller:@"DetailViewController"];

    cellModel *model16 = [cellModel cellModelWithName:@"带文字的滑动选择按钮" controller:@"SwitchButtonViewController"];

    cellModel *model17 = [cellModel cellModelWithName:@"下拉选项菜单" controller:@"DropMenuViewController"];

    cellModel *model18 = [cellModel cellModelWithName:@"多变的字体样式" controller:@"AttributeStringViewController"];


    [self.dataSource addObject:model1];
    [self.dataSource addObject:model2];
    [self.dataSource addObject:model3];
    [self.dataSource addObject:model4];
    [self.dataSource addObject:model5];
    [self.dataSource addObject:model6];
    [self.dataSource addObject:model7];
    [self.dataSource addObject:model8];
    [self.dataSource addObject:model9];
    [self.dataSource addObject:model10];
    [self.dataSource addObject:model11];
    [self.dataSource addObject:model12];
    [self.dataSource addObject:model13];
    [self.dataSource addObject:model14];
    [self.dataSource addObject:model15];
    [self.dataSource addObject:model16];
    [self.dataSource addObject:model17];
    [self.dataSource addObject:model18];


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
