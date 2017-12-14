//
//  AttributeStringViewController.m
//  MyDemo
//
//  Created by ShanCheli on 2017/12/14.
//  Copyright © 2017年 shancheli. All rights reserved.
//

#import "AttributeStringViewController.h"


#define buttonTag 12090857
#define GatoViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

@interface AttributeStringViewController ()
@property (nonatomic ,strong) UILabel * label;

@end

@implementation AttributeStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc]init];
    self.label.text = @"测试文字啦啦啦啦【我是将要改变的内容 啦啦啦啦啦哈哈哈哈啦啦啦啦哈哈哈哈啦啊哈了啊哗啦哗啦啦哈啦哈啦哈啦】qwe123哈哈哈哈哈哈哈哈哈哈啊哈测试文字啦啦啦啦qwe123哈哈哈哈哈哈哈哈哈哈啊哈测试文字啦啦啦啦qwe123哈哈哈哈哈哈哈哈哈哈啊哈测试文字啦啦啦啦qwe123哈哈哈哈哈哈哈哈哈哈啊哈";
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    self.label.frame = CGRectMake(10, 20, self.view.bounds.size.width - 20, 200);
    
    
    NSArray * array = @[@"改变字体大小",@"设置基线偏移值",@"改变字体颜色",@"改变背景颜色",@"改变字间距",@"删除线",@"下划线",@"设置下划线颜色",@"设置删除线颜色",@"边缘线颜色",@"边缘线宽度",@"label阴影",@"横竖排版",@"字体倾斜",@"文本扁平化",@"URL链接"];
    for (int i = 0 ; i < array.count; i ++) {
        CGFloat x = i % 2;
        CGFloat y = i / 2;
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = i + buttonTag;
        [button addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.frame = CGRectMake(x * ( self.view.bounds.size.width - 20 ) / 2 + 10, y * 40 + 250, ( self.view.bounds.size.width - 20 ) / 2 - 15, 30);
        GatoViewBorderRadius(button, 5, 1, [UIColor blackColor]);
    }
}
- (void)buttonDidClicked:(UIButton *)sender
{
    // 创建对象.
    NSMutableAttributedString *mAttStri = [[NSMutableAttributedString alloc] initWithString:self.label.text];
    //
    NSRange range = [self.label.text rangeOfString:@"我是将要改变的内容 啦啦啦啦啦哈哈哈哈啦啦啦啦哈哈哈哈啦啊哈了啊哗啦哗啦啦哈啦哈啦哈啦"];
    
    
    
    switch (sender.tag - buttonTag) {
        case 0:
        {
            [mAttStri addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica" size:30] range:range];
        }
            break;
        case 1:
        {
            [mAttStri addAttribute:NSBaselineOffsetAttributeName value:@10 range:range];
        }
            break;
        case 2:
        {
            [mAttStri addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
        }
            break;
        case 3:
        {
            [mAttStri addAttribute:NSBackgroundColorAttributeName value:[UIColor blueColor] range:range];
        }
            break;
        case 4:
        {
            [mAttStri addAttribute:NSKernAttributeName value:@10 range:range];
        }
            break;
        case 5:
        {
            /*
             NSUnderlineStyleNone 不设置删除线
             NSUnderlineStyleSingle 设置删除线为细单实线
             NSUnderlineStyleThick 设置删除线为粗单实线
             NSUnderlineStyleDouble 设置删除线为细双实线
             */
            [mAttStri addAttribute:NSStrikethroughStyleAttributeName value:@1 range:range];
        }
            break;
        case 6:
        {
            /*
             NSUnderlineStyleNone 不设置
             NSUnderlineStyleSingle 设置下划线为细单实线
             NSUnderlineStyleThick 设置下划线为粗单实线
             NSUnderlineStyleDouble 设置下划线为细双实线
             */
            [mAttStri addAttribute:NSUnderlineStyleAttributeName value:@1 range:range];
        }
            break;
        case 7:
        {
            [mAttStri addAttribute:NSUnderlineStyleAttributeName value:@1 range:range];
            [mAttStri addAttribute:NSUnderlineColorAttributeName value:[UIColor greenColor] range:range];
        }
            break;
        case 8:
        {
            [mAttStri addAttribute:NSStrikethroughStyleAttributeName value:@1 range:range];
            [mAttStri addAttribute:NSStrikethroughColorAttributeName value:[UIColor orangeColor] range:range];
        }
            break;
        case 9:
        {
            [mAttStri addAttribute:NSStrokeColorAttributeName value:[UIColor yellowColor] range:range];
            [mAttStri addAttribute:NSStrokeWidthAttributeName value:@0.2 range:range];
            
        }
            break;
        case 10:
        {
            
            [mAttStri addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica" size:30] range:range];
            [mAttStri addAttribute:NSStrokeColorAttributeName value:[UIColor yellowColor] range:range];
            [mAttStri addAttribute:NSStrokeWidthAttributeName value:@0.8 range:range];
            
        }
            break;
        case 11:
        {
            NSShadow * shadow = [[NSShadow alloc]init];
            shadow.shadowBlurRadius = 5;//模糊度
            shadow.shadowColor = [UIColor orangeColor];//阴影颜色
            shadow.shadowOffset = CGSizeMake(1, 3);//偏移量
            [mAttStri addAttribute:NSShadowAttributeName value:shadow range:range];
            [mAttStri addAttribute:NSVerticalGlyphFormAttributeName value:@0 range:range];
        }
            break;
        case 12:
        {
            [mAttStri addAttribute:NSVerticalGlyphFormAttributeName value:@1 range:range];
        }
            break;
        case 13:
        {
            [mAttStri addAttribute:NSObliquenessAttributeName value:@1 range:range];
        }
            break;
        case 14:
        {
            [mAttStri addAttribute:NSExpansionAttributeName value:@1 range:range];
        }
            break;
        case 15:
        {
            [mAttStri addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"http://www.jianshu.com/p/6ce45e367519"] range:range];
        }
            break;
            
        default:
            break;
    }
    self.label.attributedText = mAttStri;
}

@end
