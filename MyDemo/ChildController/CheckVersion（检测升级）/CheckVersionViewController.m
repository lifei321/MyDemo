//
//  CheckVersionViewController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/12/1.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "CheckVersionViewController.h"
#import "QJCheckVersionUpdate.h"

@interface CheckVersionViewController ()

@end

@implementation CheckVersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self checkVerionUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  检查版本更新
 */
- (void)checkVerionUpdate
{
    QJCheckVersionUpdate *update = [[QJCheckVersionUpdate alloc] init];
    [update showAlertView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
