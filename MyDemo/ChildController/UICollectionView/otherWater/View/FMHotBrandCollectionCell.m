//
//  FMHotBrandCollectionCell.m
//  ForMan
//
//  Created by 陈炜来 on 16/6/26.
//  Copyright © 2016年 RuiBao. All rights reserved.
//

#import "FMHotBrandCollectionCell.h"

@interface FMHotBrandCollectionCell ()
@property (weak, nonatomic) IBOutlet UIView *leftSepLine;
@property (weak, nonatomic) IBOutlet UIView *rightSepLine;
@property (weak, nonatomic) IBOutlet UIView *bottomSepLine;

@end

@implementation FMHotBrandCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor=[UIColor redColor];
}

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath=indexPath;
    _leftSepLine.hidden= indexPath.row%2==1?YES:NO;
}

@end
