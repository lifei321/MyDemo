//
//  cellModel.m
//  MyDemo
//
//  Created by ShanCheli on 16/10/19.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "cellModel.h"

@implementation cellModel

+ (instancetype)cellModelWithName:(NSString *)name controller:(NSString *)controller {
    cellModel *model = [[cellModel alloc] init];
    model.cellName = name;
    model.pushController = controller;
    return model;
}

@end
