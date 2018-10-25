//
//  MyCollectionViewCell.m
//  UICollectionView瀑布流
//
//  Created by Jones on 10/18/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "MyCollectionViewCell.h"
@interface MyCollectionViewCell(){

}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation MyCollectionViewCell

+(instancetype)createCellWithCollectionView:(UICollectionView*)collectionView indexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"www.imooc.com.cv" forIndexPath:indexPath];
//    if (cell==nil) {
//        all
    
//    }
    return cell;
}
-(void)loadData:(MyImage*)mImage{
    self.imageView.image = [UIImage imageNamed:mImage.image];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
