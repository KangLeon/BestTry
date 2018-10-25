//
//  MixImageText.m
//  NewsApp
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "MixImageText.h"

@interface MixImageText(){
    
    UIImageView *imageview;
    UILabel *label;
    UILabel *url;
}
@end

@implementation MixImageText

-(id)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        imageview=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height*2, self.frame.size.height)];
        [self addSubview:imageview];
        label=[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.height*2, 0, self.frame.size.width-self.frame.size.height*2, self.frame.size.height-20)];
        label.font=[UIFont systemFontOfSize:12.0];
        label.numberOfLines=0;//行数自适应
        [self addSubview:label];
        url=[[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.height*2, self.frame.size.height-20, self.frame.size.width-self.frame.size.height*2, 20)];
        url.textColor=[UIColor orangeColor];
        url.font=[UIFont systemFontOfSize:10.0];
        url.textAlignment=NSTextAlignmentRight;
        [self addSubview:url];
    }
    return self;
}

-(void)setImage:(NSString *)imagestring{
    imageview.image=[UIImage imageNamed:imagestring];
}

-(void)setTitle:(NSString *)title{
    label.text=title;
}

-(void)setUrl:(NSString*)urlTitle{
    url.text=urlTitle;
}

@end
