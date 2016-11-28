//
//  OtherWaterViewController.m
//  MyDemo
//
//  Created by ShanCheli on 16/11/28.
//  Copyright © 2016年 shancheli. All rights reserved.
//

#import "OtherWaterViewController.h"
#import "FMHotBrandLayout.h"
#import "FMHotBrandCollectionCell.h"
#import "FMHotBrandCeollctionSectionHeadView.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
#define SECTION_WIDTH  SCREEN_WIDTH *0.56

@interface OtherWaterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *mcollectionView;

@end

@implementation OtherWaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self _buildingCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)_buildingCollectionView
{
    //    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    FMHotBrandLayout *layout=[[FMHotBrandLayout alloc]init];
    CGFloat width= SECTION_WIDTH/2;
    layout.headerReferenceSize=CGSizeMake(SECTION_WIDTH, 52);
    layout.itemSize = CGSizeMake(width,width);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset=UIEdgeInsetsMake(0, 10, 0, 0);
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    self.mcollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 300) collectionViewLayout:layout];
    self.mcollectionView.scrollsToTop = NO;
    self.mcollectionView.delegate=self;
    self.mcollectionView.dataSource=self;
    [self.mcollectionView setBackgroundColor:[UIColor blueColor]];
    self.mcollectionView.showsVerticalScrollIndicator=NO;
    self.mcollectionView.showsHorizontalScrollIndicator=NO;
    [self.mcollectionView registerNib:[UINib nibWithNibName:@"FMHotBrandCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"FMHotBrandCollectionCell"];
    [self.mcollectionView registerNib:[UINib nibWithNibName:@"FMHotBrandCeollctionSectionHeadView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"FMHotBrandCeollctionSectionHeadView"];//折叠的文字品牌
    [self.view addSubview:self.mcollectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FMHotBrandCollectionCell *cell=(FMHotBrandCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FMHotBrandCollectionCell" forIndexPath:indexPath];
    cell.mTitleLabel.text=[NSString stringWithFormat:@"%ld",indexPath.item];
    cell.indexPath=indexPath;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        FMHotBrandCeollctionSectionHeadView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FMHotBrandCeollctionSectionHeadView" forIndexPath:indexPath];
        cell.brandNameLaebl.text=[NSString stringWithFormat:@"head %ld",indexPath.section];
        return cell;
    }
    return nil;
}
@end
