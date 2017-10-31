//
//  LogisticsTableViewCell.m
//  logisticsInfo
//
//  Created by My Mac on 2017/6/8.
//  Copyright © 2017年 MyMac. All rights reserved.
//

#import "LogisticsTableViewCell.h"
#import "LogisticsInfo.h"
#import "LogisticsTableViewCellFrame.h"
@interface LogisticsTableViewCell()


@end

@implementation LogisticsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void) setupUI
{
//    self.layer.masksToBounds = YES;
    
    
    _imgView = [[UIImageView alloc]init];
    _imgView.layer.cornerRadius = 7.5;
    _imgView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_imgView];
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_lineView];
    
    _addressLabel = [self setLableTextFont:16 textColor:[UIColor blackColor]];
    _infoLabel = [self setLableTextFont:14 textColor:[UIColor grayColor]];
    _timeLabel = [self setLableTextFont:12 textColor:[UIColor grayColor]];
}

-(void)setLogisticsTableViewCellFrame:(LogisticsTableViewCellFrame *)logisticsTableViewCellFrame
{
    _logisticsTableViewCellFrame = logisticsTableViewCellFrame;
    
    LogisticsInfo *logisticsInfo = logisticsTableViewCellFrame.logisticsInfo;
    
    _imgView.frame = logisticsTableViewCellFrame.imgViewFrame;
    
    _lineView.frame = logisticsTableViewCellFrame.lineViewFrame;
    
    _addressLabel.frame = logisticsTableViewCellFrame.addressFrame;
    _addressLabel.text = logisticsInfo.address;
    
    _infoLabel.frame = logisticsTableViewCellFrame.infoFrame;
    _infoLabel.text = logisticsInfo.info;
    
    _timeLabel.frame = logisticsTableViewCellFrame.timeFrame;
    _timeLabel.text = logisticsInfo.time;
}

-(UILabel *)setLableTextFont:(CGFloat)fontSize textColor:(UIColor *)color
{
    UILabel *lable = [[UILabel alloc]init];
    lable.textAlignment = NSTextAlignmentLeft;
    lable.font = [UIFont systemFontOfSize:fontSize];
    lable.textColor = color;
    lable.numberOfLines = 0;
    [self.contentView addSubview:lable];
    return lable;
}
@end
