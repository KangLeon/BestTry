//
//  MyCollectionViewCell.m
//  UICollectionView瀑布流
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation MyCollectionViewCell

+(instancetype)createCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collectionviewcell" forIndexPath:indexPath];
    return cell;
}

-(void)loadData:(MyImage *)mImage{
    self.imageView.image=[UIImage imageNamed:mImage.image];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
