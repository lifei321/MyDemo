//
//  DropDownThirdViewController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/12/14.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "DropDownThirdViewController.h"
#import "SQFiltrateView.h"

@interface DropDownThirdViewController ()

@end

@implementation DropDownThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    SQFiltrateItem *item1 = [[SQFiltrateItem alloc]init];
    item1.listType = OptionListType_Tag;
    item1.numberType = OptionNumberType_Many;
    item1.optionData = @[@"select1",@"select2",@"select3",@"select4",@"select5",@"select6"];
    item1.title = @"item1";
    
    
    SQFiltrateItem *item2 = [[SQFiltrateItem alloc]init];
    item2.listType = OptionListType_Cell;
    item2.numberType = OptionNumberType_Single;
    item2.optionData = @[@"select1",@"select2",@"select3",@"select4",@"select5",@"select6"];
    item2.title = @"item2";
    
    
    SQFiltrateItem *item3 = [[SQFiltrateItem alloc]init];
    item3.listType = OptionListType_Tag;
    item3.numberType = OptionNumberType_Many;
    item3.optionData = @[@"select1",@"select2",@"select3",@"select4",@"select5",@"select6"];
    item3.title = @"item3";
    
    SQFiltrateView *filtrateView = [[SQFiltrateView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, 40)
                                                          filtrateItems:@[item1,item2,item3]];
    [filtrateView touchBlock:^(SQFiltrateView * _Nonnull view, SQFiltrateItem * _Nonnull item) {
        NSLog(@"%@:%@",item.title,item.choseSet);
    }];
    [self.view addSubview:filtrateView];
}


@end
