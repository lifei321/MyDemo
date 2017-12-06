//
//  MoreDropDownMenuRowCell.h
//
//
//  Created by ZOMAKE on 2017/10/9.
//  Copyright © 2017年 Brancs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import "NSArray+ZMAdd.h"


#define WEAKSELF __weak typeof(self) weakSelf = self
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define FIT_WIDTH [UIScreen mainScreen].bounds.size.width/375

#define KSelectBorderColor      [UIColor colorWithRed:253/255.0 green:206/255.0 blue:41/255.0 alpha:1]
#define KUnSelectBorderColor    [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1]
#define KButtonColor            [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]


@interface MoreDropDownMenuRowCell : UITableViewCell

/**  */
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) void(^clickTagBlock)(NSString *);
/** 选中的按钮 */
@property (nonatomic, strong) UIButton *selectButton;

- (void)setUI:(NSArray *)dataArray;

@end

@interface MoreDropDownMenuRowCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIButton  *button;
@property (nonatomic, assign) BOOL      selectCell;
- (void)setupUI:(NSString *)text;



@end

