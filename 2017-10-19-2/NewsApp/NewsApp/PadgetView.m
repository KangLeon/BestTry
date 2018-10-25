//
//  PadgetView.m
//  NewsApp
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "PadgetView.h"

@implementation PadgetView

-(id)initWithPoint:(CGPoint)point message:(int)message{
    
    CGRect rect;
    NSString *labelString=nil;
    if(message<10){
        rect=CGRectMake(point.x, point.y, 20, 20);
        labelString=[NSString stringWithFormat:@"%d",message];
    }else if(message<100){
        rect=CGRectMake(point.x, point.y, 40, 20);
        labelString=[NSString stringWithFormat:@"%d",message];
    }else{
        rect=CGRectMake(point.x, point.y, 40, 20);
        labelString=[NSString stringWithFormat:@"%@",@"99+"];
    }
    if(self=[super initWithFrame:rect]){
        self.textColor=[UIColor whiteColor];
        self.textAlignment=NSTextAlignmentCenter;
        self.backgroundColor=[UIColor redColor];
        self.text=labelString;
        self.layer.cornerRadius=10.0;
        self.layer.masksToBounds=true;//表明当前的view先按照当前的layer剪切
    }
    return self;
}

@end
