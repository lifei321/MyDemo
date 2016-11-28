//
//  FMHotBrandCeollctionSectionHeadView.m
//  ForMan
//
//  Created by 陈炜来 on 16/9/1.
//  Copyright © 2016年 RuiBao. All rights reserved.
//

#import "FMHotBrandCeollctionSectionHeadView.h"
@interface FMHotBrandCeollctionSectionHeadView ()
@property (weak, nonatomic) IBOutlet UIView *topSepline;
@property (weak, nonatomic) IBOutlet UIView *leftSepLine;
@property (weak, nonatomic) IBOutlet UIView *rightSepLine;
@property (weak, nonatomic) IBOutlet UIView *bottomSepLine;

@end

@implementation FMHotBrandCeollctionSectionHeadView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor=[UIColor lightGrayColor];

}

@end
