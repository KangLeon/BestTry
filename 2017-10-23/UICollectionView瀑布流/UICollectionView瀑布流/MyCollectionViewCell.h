//
//  MyCollectionViewCell.h
//  UICollectionView瀑布流
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImage.h"

@interface MyCollectionViewCell : UICollectionViewCell
-(void)loadData:(MyImage *)mImage;
+(instancetype)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
