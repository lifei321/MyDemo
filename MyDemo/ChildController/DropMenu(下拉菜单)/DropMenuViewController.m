//
//  DropMenuViewController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/12/14.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "DropMenuViewController.h"
#import "PopupView.h"

@interface DropMenuViewController ()

@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIButton *autoBtn;

@end

@implementation DropMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"测试一发";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _leftBtn = [[UIButton alloc]init];
    [_leftBtn setTitle:@"左边" forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    _rightBtn = [[UIButton alloc]init];
    [_rightBtn setTitle:@"右边" forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    _autoBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
    [_autoBtn setTitle:@"自由按钮" forState:UIControlStateNormal];
    [_autoBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_autoBtn setBackgroundColor:[UIColor greenColor]];
    [_autoBtn addTarget:self action:@selector(autoBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_autoBtn];
}

- (void)leftBtnAction
{
    [PopupView addCellWithIcon:nil text:@"第一个" action:^{
        
        NSLog(@"别点第一个");
    }];
    [PopupView addCellWithIcon:nil text:@"第二个" action:^{
        
        NSLog(@"别点第二个");
    }];
    [PopupView popupViewInPosition:ShowLeft];
}
- (void)rightBtnAction
{
    [PopupView addCellWithIcon:nil text:@"第一个" action:^{
        
        NSLog(@"别点第一个");
    }];
    [PopupView addCellWithIcon:nil text:@"第二个" action:^{
        
        NSLog(@"别点第二个");
    }];
    [PopupView popupViewInPosition:ShowRight];
}
- (void)autoBtnAction:(UIButton *)sender
{
    [PopupView addCellWithIcon:nil text:@"第一个" action:^{
        
        NSLog(@"别点第一个");
    }];
    [PopupView addCellWithIcon:nil text:@"第二个" action:^{
        
        NSLog(@"别点第二个");
    }];
    [PopupView popupViewInButton:sender];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}



@end
