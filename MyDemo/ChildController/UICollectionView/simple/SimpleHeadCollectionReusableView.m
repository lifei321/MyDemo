//
//  SimpleHeadCollectionReusableView.m
//  MyDemo
//
//  Created by ShanCheli on 2018/1/29.
//  Copyright © 2018年 shancheli. All rights reserved.
//

#import "SimpleHeadCollectionReusableView.h"

@implementation SimpleHeadCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        label.text = @"header";
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}

@end
