//
//  cellModel.h
//  MyDemo
//
//  Created by ShanCheli on 16/10/19.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cellModel : NSObject

@property (nonatomic, copy) NSString *cellName;

@property (nonatomic, copy) NSString *pushController;


+ (instancetype)cellModelWithName:(NSString *)name controller:(NSString *)controller;

@end
