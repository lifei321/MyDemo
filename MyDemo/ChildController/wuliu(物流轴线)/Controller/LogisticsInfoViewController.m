//
//  LogisticsInfoViewController.m
//  logisticsInfo
//
//  Created by My Mac on 2017/6/8.
//  Copyright © 2017年 MyMac. All rights reserved.
//

#define ID @"myCell"
#import "LogisticsInfoViewController.h"
#import "LogisticsInfo.h"
#import "LogisticsTableViewCellFrame.h"
#import "LogisticsTableViewCell.h"

@interface LogisticsInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *logisticsTableView;

@property(nonatomic,strong) NSArray *logisticsInfoData;
@end

@implementation LogisticsInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self logisticsInfoData];
    self.navigationItem.title = @"物流状态";
    _logisticsTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _logisticsTableView.delegate = self;
    _logisticsTableView.dataSource = self;
    [_logisticsTableView registerClass:[LogisticsTableViewCell class] forCellReuseIdentifier:ID];
    _logisticsTableView.separatorInset = UIEdgeInsetsMake(0, 40, 0, 0);
    [self.view addSubview:_logisticsTableView];
}

-(NSArray *)logisticsInfoData
{
    if (!_logisticsInfoData) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"logisticsInfo.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *marr = [NSMutableArray new];
        
        for (NSDictionary *dict in arr) {
            LogisticsInfo *logisticsInfo = [LogisticsInfo logisticsWithDict:dict];
            LogisticsTableViewCellFrame *cellFrame = [[LogisticsTableViewCellFrame alloc]init];
            cellFrame.logisticsInfo = logisticsInfo;
            [marr addObject:cellFrame];
        }
        _logisticsInfoData = marr;
    }
    return _logisticsInfoData;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _logisticsInfoData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LogisticsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
        cell = [[LogisticsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    LogisticsTableViewCellFrame *cellFrame = _logisticsInfoData[indexPath.row];
    cell.logisticsTableViewCellFrame = cellFrame;
    if (indexPath.row ==0) {
        cell.imgView.backgroundColor = [UIColor greenColor];
        cell.lineView.backgroundColor = [UIColor greenColor];
        cell.addressLabel.textColor = [UIColor greenColor];
        cell.infoLabel.textColor = [UIColor greenColor];
        cell.timeLabel.textColor = [UIColor greenColor];
    } else {
        cell.imgView.backgroundColor = [UIColor grayColor];
        cell.lineView.backgroundColor = [UIColor grayColor];
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LogisticsTableViewCellFrame *cellFrame = _logisticsInfoData[indexPath.row];
    return cellFrame.rowHeight;
}

@end
