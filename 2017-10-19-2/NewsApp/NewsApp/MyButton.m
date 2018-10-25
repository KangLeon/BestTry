//
//  MyButton.m
//  NewsApp
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "MyButton.h"


@implementation MyButton

-(id)initWithFrame:(CGRect)frame image:(NSString*)image title:(NSString*)title{
    if(self=[super initWithFrame:frame]){
        [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        //想实现剧中显示可以修改属性或者修改坐标
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return self;
}
//确定按钮上的image的位置：mubutton的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat w=contentRect.size.width;
    CGFloat h=w;
    CGFloat x=0;
    CGFloat y=0;
    return CGRectMake(x, y, w, h);
}

//确定按钮上的title的位置
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat w=contentRect.size.width;
    CGFloat h=contentRect.size.height-contentRect.size.width;
    CGFloat x=0;
    CGFloat y=contentRect.size.width;
    return CGRectMake(x, y, w, h);
}

@end
