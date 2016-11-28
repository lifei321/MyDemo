//
//  EasyWaterViewController.m
//  MyDemo
//
//  Created by ShanCheli on 16/11/28.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "EasyWaterViewController.h"
#import "PCollectionViewLayout.h"
#import "CollectionViewCell.h"

@interface EasyWaterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,PCollectionViewLayoutDelegate>

@property(nonatomic,strong)UICollectionView * collectionView;

@end

@implementation EasyWaterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PCollectionViewLayout * layout = [[PCollectionViewLayout alloc]init];
    layout.delegate =self;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

-(CGFloat)waterFlow:(PCollectionViewLayout *)flow heightForWidth:(CGFloat)width indexPath:(NSIndexPath *)index{
    if (index.item%2==0) {
        return 150;
    }else{
        return 111;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}
@end
