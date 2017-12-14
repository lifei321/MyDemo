//
//  SwitchButtonViewController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/12/14.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "SwitchButtonViewController.h"
#import "WZSwitch.h"


@interface SwitchButtonViewController ()
@property(nonatomic,strong)WZSwitch     *mySwitch;

@end

@implementation SwitchButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.mySwitch = [[WZSwitch alloc]initWithFrame:CGRectMake(100, 100, 105, 36)];
    
    
    [self.mySwitch setSwitchState:YES animation:NO];
    
    [self.mySwitch setTextFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    
    self.mySwitch.block = ^(BOOL state) {
        //yes 音频  no 视频
        
    };
    
    [self.view addSubview:_mySwitch];


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
