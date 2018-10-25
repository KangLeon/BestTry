//
//  MyUICollectionViewLayout.h
//  UICollectionView瀑布流
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MycollectionViewLayoutDelegate<NSObject>
-(float)getCellH:(float)width index:(int)index;
@end

@interface MyUICollectionViewLayout : UICollectionViewLayout

@property(nonatomic,weak)id<MycollectionViewLayoutDelegate> delegate;

@end
