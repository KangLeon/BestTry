//
//  MiddleView.m
//  NewsApp
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "MiddleView.h"
#import "MKConstant.h"
#import "PadgetView.h"
#import "MaskView.h"
#import "MixImageText.h"

@interface MiddleView()<UIScrollViewDelegate>{
    
    NSArray *types;
    UIScrollView *scrollView;
    PadgetView *padgetView;
    UIScrollView *newScrollView;
    NSMutableArray *arrayInfo;
    MaskView *maskView;
}
@end

@implementation MiddleView
-(id)initWithFrame:(CGRect)frame newsType:(NSArray *)type{
    if(self=[super initWithFrame:frame]){
        types=type;
        [self addScrollview];
    }
    return self;
}
-(void)addScrollview{
    scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    scrollView.contentSize=CGSizeMake(100*types.count, 40);
    scrollView.contentOffset=CGPointMake(0, 0);
    scrollView.backgroundColor=PINKCOLOR;
    scrollView.showsHorizontalScrollIndicator=false;
    
    [self addSubview:scrollView];
    for(int i=0;i<types.count;i++){
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(i*100, 0, 100, 40)];
        NSString *buttontile=[types objectAtIndex:i];
        [button setTitle:buttontile forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        //区分点击哪个按钮
        button.tag=10000+i;
        [scrollView addSubview:button];
        if(i==0){
            button.layer.borderColor=[UIColor grayColor].CGColor;
            button.layer.borderWidth=2.0;
            button.layer.cornerRadius=5.0;
            padgetView=[[PadgetView alloc] initWithPoint:CGPointMake(button.frame.size.width-40, 0) message:500];
            [button addSubview:padgetView];
        }
        if(i==1){
            button.layer.borderColor=[UIColor grayColor].CGColor;
            button.layer.borderWidth=2.0;
            button.layer.cornerRadius=5.0;
            padgetView=[[PadgetView alloc] initWithPoint:CGPointMake(button.frame.size.width-40, 0) message:22];
            [button addSubview:padgetView];
        }
        if(i==2){
            button.layer.borderColor=[UIColor grayColor].CGColor;
            button.layer.borderWidth=2.0;
            button.layer.cornerRadius=5.0;
            padgetView=[[PadgetView alloc] initWithPoint:CGPointMake(button.frame.size.width-40, 0) message:99];
            [button addSubview:padgetView];
        }
        if(i==4){
            button.layer.borderColor=[UIColor grayColor].CGColor;
            button.layer.borderWidth=2.0;
            button.layer.cornerRadius=5.0;
            padgetView=[[PadgetView alloc] initWithPoint:CGPointMake(button.frame.size.width-20, 0) message:30];
            [button addSubview:padgetView];
        }
    }
}

-(void)buttonAction:(UIButton*)btn{
    btn.layer.borderColor=[UIColor grayColor].CGColor;
    btn.layer.borderWidth=2.0;
    btn.layer.cornerRadius=5.0;
    for (UIButton *item in scrollView.subviews) {
        if(item.tag>=10000&&item.tag<=10000+types.count&&(item.tag!=btn.tag)){
            item.layer.borderWidth=0.0;
        }
    }
}

-(void)addNewsScrollView{
    newScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 162)];
    newScrollView.contentSize=CGSizeMake(SCREEN_WIDTH*3, 162);
    newScrollView.contentOffset=CGPointMake(0, 0);
    newScrollView.showsHorizontalScrollIndicator=false;
    newScrollView.pagingEnabled=true;
    newScrollView.delegate=self;
    int i=0;
    arrayInfo=[[NSMutableArray alloc] init];
    for (NSDictionary *item in _newsInfo) {
        NSString *image=[item valueForKey:@"image"];
        NSString *info=[item valueForKey:@"info"];
        [arrayInfo addObject:info];
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i++, 0, SCREEN_WIDTH, 162)];
        imageView.image=[UIImage imageNamed:image];
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        [newScrollView  addSubview:imageView];
    }
    
    [self addSubview:newScrollView];
    
    maskView=[[MaskView alloc] initWithFrame:CGRectMake(0, 202-20, SCREEN_WIDTH, 20)];
    NSString *title=[arrayInfo objectAtIndex:0];
    [maskView setTitle:title];
    [maskView setPageControlNum:0];
    [self addSubview:maskView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int currentPageNum=(int)scrollView.contentOffset.x/SCREEN_WIDTH;
    NSString *title=[arrayInfo objectAtIndex:currentPageNum];
    [maskView setTitle:title];
    [maskView setPageControlNum:currentPageNum];
}

-(void)addMixImageTextFrame:(CGRect)frame image:(NSString*)image title:(NSString*)title url:(NSString*)url{
    MixImageText *mixImageText=[[MixImageText alloc] initWithFrame:frame];
    [self addSubview:mixImageText];
    [mixImageText setImage:image];
    [mixImageText setTitle:title];
    [mixImageText setUrl:url];
}
@end
