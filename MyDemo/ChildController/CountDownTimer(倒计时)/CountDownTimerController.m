//
//  CountDownTimerController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/12/6.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "CountDownTimerController.h"
#import "CountDownViewController.h"
#import "CountDownInCellViewController.h"


@interface CountDownTimerController ()

@end

@implementation CountDownTimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"倒计时";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *selectButton1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 240, 300, 40)];
    [selectButton1 setTitle:@"单独的倒计时" forState: UIControlStateNormal];
    [selectButton1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:selectButton1];
    [selectButton1 addTarget:self action:@selector(selectIndexPathAction1) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *selectButton2 = [[UIButton alloc] initWithFrame:CGRectMake(20, 340, 300, 40)];
    [selectButton2 setTitle:@"cell中的倒计时" forState: UIControlStateNormal];
    [selectButton2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:selectButton2];
    [selectButton2 addTarget:self action:@selector(selectIndexPathAction2) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)selectIndexPathAction1 {
    CountDownViewController *countvc = [CountDownViewController new];
    countvc.title = @"单独的倒计时";
    [self.navigationController pushViewController:countvc animated:YES];
}

- (void)selectIndexPathAction2 {
    
    CountDownInCellViewController *countvc = [CountDownInCellViewController new];
    countvc.title = @"cell中的倒计时";
    [self.navigationController pushViewController:countvc animated:YES];

}



@end
