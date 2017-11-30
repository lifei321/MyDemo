//
//  SelectCityViewController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/11/30.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "SelectCityViewController.h"
#import "CityPickerVeiw.h"

@interface SelectCityViewController ()

@end

@implementation SelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    releaseBtn.frame=CGRectMake(100, 100, self.view.frame.size.width/2, 30);
    [releaseBtn setTitle:@"点击选择" forState:UIControlStateNormal];
    releaseBtn.backgroundColor=[UIColor redColor];
    [releaseBtn addTarget:self action:@selector(releaseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:releaseBtn];
    releaseBtn.center=self.view.center;
}
- (void)releaseBtnClick:(UIButton *)btn {
    CityPickerVeiw * cityView = [[CityPickerVeiw alloc] init];
    [cityView show];
    cityView.showSelectedCityNameStr=btn.titleLabel.text;
    [cityView setCityBlock:^(NSString * value) {
        [btn setTitle:value forState:UIControlStateNormal];
    }];
}


@end
