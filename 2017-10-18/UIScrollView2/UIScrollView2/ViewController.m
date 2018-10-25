//
//  ViewController.m
//  UIScrollView2
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()<UIScrollViewDelegate>{
    UIScrollView *scrollview;
    NSTimer *timer;
    int imageIndex;
    UIPageControl *pageControl;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self scrollview];
}

-(void)scrollview{
    scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 200)];
    scrollview.contentSize=CGSizeMake(SCREEN_WIDTH*4, 200);
    scrollview.backgroundColor=[UIColor clearColor];
    scrollview.delegate=self;
    scrollview.pagingEnabled=true;
    
    scrollview.layer.borderColor=[UIColor grayColor].CGColor;//边框的一些属性
    scrollview.layer.borderWidth=1.0;
    scrollview.layer.cornerRadius=10.0;
    
    
    for(int i=0;i<4;i++){
        UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, 200)];
        NSString *imageI=[NSString stringWithFormat:@"%d.jpg",i+1];
        imageview.image=[UIImage imageNamed:imageI];
        [scrollview addSubview:imageview];
    }
    [self.view addSubview: scrollview];
    
    pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0, 220, SCREEN_WIDTH, 20)];
    pageControl.numberOfPages=4;
    pageControl.currentPage=0;
    pageControl.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:pageControl];
    
    timer=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(imagePlay) userInfo:nil repeats:true];
    imageIndex=0;
}

-(void)scrollViewDidScroll:(UIScrollView *)mscrollView{
    float x=mscrollView.contentOffset.x;
    if(x==SCREEN_WIDTH*0){
         pageControl.currentPage=0;
    }else  if(x==SCREEN_WIDTH*1){
        pageControl.currentPage=1;
    }else  if(x==SCREEN_WIDTH*2){
        pageControl.currentPage=2;
    }else  if(x==SCREEN_WIDTH*3){
        pageControl.currentPage=3;
    }
}

-(void)imagePlay{
    imageIndex++;
    if(imageIndex>=4){
        imageIndex=0;
    }
    scrollview.contentOffset=CGPointMake(imageIndex*SCREEN_WIDTH, 0);
}

@end
