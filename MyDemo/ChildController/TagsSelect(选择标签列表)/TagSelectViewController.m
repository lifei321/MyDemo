//
//  TagSelectViewController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/12/6.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "TagSelectViewController.h"
#import "ChannelTags.h"


@interface TagSelectViewController (){
    
    __block NSMutableArray *_myTags;
    __block NSMutableArray *_recommandTags;
    
}

@property (strong, nonatomic) UILabel *tagLabel;

@end

@implementation TagSelectViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 300, 100)];
    self.tagLabel.textColor = [UIColor orangeColor];
    self.tagLabel.font = [UIFont systemFontOfSize:15];
    self.tagLabel.numberOfLines = 0;
    self.tagLabel.text = @"选择标签返回的内容";
    [self.view addSubview:self.tagLabel];
    
    
    UIButton *selectButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 340, 300, 40)];
    [selectButton setTitle:@"请选择标签" forState: UIControlStateNormal];
    [selectButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:selectButton];
    [selectButton addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    _myTags = @[@"关注",@"推荐",@"热点",@"北京",@"视频",@"社会",@"图片",@"娱乐",@"问答",@"科技",@"汽车",@"财经",@"军事",@"体育",@"段子",@"国际",@"趣图",@"健康",@"特卖",@"房产",@"美食"].mutableCopy;
    _recommandTags = @[@"小说",@"时尚",@"历史",@"育儿",@"直播",@"搞笑",@"数码",@"养生",@"电影",@"手机",@"旅游",@"宠物",@"情感",@"家居",@"教育",@"三农"].mutableCopy;
    
}

- (void)chooseBtn:(id)sender {
    //秀出来选择框
    ChannelTags *controller = [[ChannelTags alloc]initWithMyTags:_myTags andRecommandTags:_recommandTags];
    [self presentViewController:controller animated:YES completion:^{}];
    
    //所有的已选的tags
    __block  NSMutableString *_str = @"已选：\n".mutableCopy;
    controller.choosedTags = ^(NSArray *chooseTags, NSArray *recommandTags) {
        _myTags = @[].mutableCopy;
        _recommandTags = @[].mutableCopy;
        for (Channel *mod in recommandTags) {
            [_recommandTags addObject:mod.title];
        }
        for (Channel *mod in chooseTags) {
            [_myTags addObject:mod.title];
            [_str appendString:mod.title];
            [_str appendString:@"、"];
        }
        _tagLabel.text = _str;
    };
    
    //单选tag
    controller.selectedTag = ^(Channel *channel) {
        [_str appendString:channel.title];
        _tagLabel.text = _str;
    };
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
