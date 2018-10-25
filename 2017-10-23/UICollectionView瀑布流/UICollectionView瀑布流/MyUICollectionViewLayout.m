//
//  MyUICollectionViewLayout.m
//  UICollectionView瀑布流
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "MyUICollectionViewLayout.h"

@interface MyUICollectionViewLayout()
@property(nonatomic,strong)NSMutableArray *attsArray;//cell约束
@property(nonatomic,strong)NSMutableArray *itemHeight;//高度
@end

@implementation MyUICollectionViewLayout

//这是一个初始化方法，为变量初始化
-(void)prepareLayout{
    [super prepareLayout];
    if (self.attsArray==nil) {
        self.attsArray=[[NSMutableArray alloc] init];
    }
    if (self.itemHeight==nil) {
        self.itemHeight=[[NSMutableArray alloc] init];
    }
    //获取有到少个item
    NSInteger count=[self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<count; i++) {
        NSIndexPath *indexPath=[NSIndexPath indexPathForItem:i inSection:0];
        //返回每一个item的约束
        UICollectionViewLayoutAttributes *att=[self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attsArray addObject:att];
    }
    
}

//设置滚动范围
-(CGSize)collectionViewContentSize{
    return CGSizeMake(0, 0);
}

//return 属性数组
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attsArray;
}

//约束内容
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *att=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat collectionViewW=self.collectionView.frame.size.width;
    CGFloat w=(collectionViewW-10*4)/3;
    
    CGFloat h=[self.delegate getCellH:w index:(int)indexPath.item];
    CGFloat x=10+(indexPath.row%3)*(w+10);
    CGFloat y=10;
    if (indexPath.row<3) {
        self.itemHeight[indexPath.row]=[NSNumber numberWithFloat:h];
    }
    if (indexPath.row>=3) {
        NSNumber *num_h=self.itemHeight[indexPath.row%3];
        y=20+num_h.floatValue;
    }
    att.frame=CGRectMake(x, y, w, h);
    return att;
}
@end
