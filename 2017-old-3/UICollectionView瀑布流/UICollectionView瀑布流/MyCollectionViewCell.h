//
//  MyCollectionViewCell.h
//  UICollectionView瀑布流
//
//  Created by Jones on 10/18/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImage.h"
@interface MyCollectionViewCell : UICollectionViewCell
+(instancetype)createCellWithCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath *)indexPath;
-(void)loadData:(MyImage*)mImage;
@end
