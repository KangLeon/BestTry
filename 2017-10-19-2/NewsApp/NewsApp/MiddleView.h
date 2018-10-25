//
//  MiddleView.h
//  NewsApp
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiddleView : UIView
-(id)initWithFrame:(CGRect)frame newsType:(NSArray *)type;
-(void)addNewsScrollView;
-(void)addMixImageTextFrame:(CGRect)frame image:(NSString*)image title:(NSString*)title url:(NSString*)url;
@property(nonatomic,strong)NSArray *newsInfo;
@end
