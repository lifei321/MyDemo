//
//  DropDownListController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/12/6.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "DropDownListController.h"
#import "MoreDropDownViewController.h"
#import "DropDownViewController.h"

@interface DropDownListController ()

@end

@implementation DropDownListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *selectButton1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 240, 300, 40)];
    [selectButton1 setTitle:@"跳转到成排按钮的下来列表" forState: UIControlStateNormal];
    [selectButton1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:selectButton1];
    [selectButton1 addTarget:self action:@selector(selectIndexPathAction1) forControlEvents:UIControlEventTouchUpInside];
    

    UIButton *selectButton2 = [[UIButton alloc] initWithFrame:CGRectMake(20, 340, 300, 40)];
    [selectButton2 setTitle:@"跳转到tabview构成的下拉列表" forState: UIControlStateNormal];
    [selectButton2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:selectButton2];
    [selectButton2 addTarget:self action:@selector(selectIndexPathAction2) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)selectIndexPathAction1 {
    MoreDropDownViewController *more = [[MoreDropDownViewController alloc] init];
    [self.navigationController pushViewController:more animated:YES];
    
}

- (void)selectIndexPathAction2 {
    DropDownViewController *more = [[DropDownViewController alloc] init];
    [self.navigationController pushViewController:more animated:YES];

}

@end
