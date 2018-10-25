//
//  TopView.m
//  NewsApp
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "TopView.h"
#import "MKConstant.h"

@implementation TopView

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor colorWithRed:138.0/255.0 green:206.0/255.0 blue:245.0/255.0 alpha:1.0];
    }
    return self;
}

-(void)setTitle:(NSString *)title{
    UILabel *label=[[UILabel alloc] init];
    label.text=title;
    //清除Label背景颜色
    label.backgroundColor=[UIColor clearColor];
    label.textColor=[UIColor whiteColor];
    UIFont *font=[UIFont systemFontOfSize:20.0];
    label.font=font;
    //动态计算title的宽高
    CGSize lableWH=[title sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    label.frame=CGRectMake((SCREEN_WIDTH-lableWH.width)/2, 20, lableWH.width, lableWH.height);
    [self addSubview:label];
    
}

@end
