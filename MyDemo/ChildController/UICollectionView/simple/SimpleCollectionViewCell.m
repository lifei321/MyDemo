//
//  SimpleCollectionViewCell.m
//  MyDemo
//
//  Created by ShanCheli on 2018/1/29.
//  Copyright © 2018年 shancheli. All rights reserved.
//

#import "SimpleCollectionViewCell.h"

@implementation SimpleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor orangeColor];
        self.label = [[UILabel alloc] initWithFrame:self.bounds];
        self.label.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.label];
        self.label.textAlignment = NSTextAlignmentCenter;

    }
    return self;
}

@end
