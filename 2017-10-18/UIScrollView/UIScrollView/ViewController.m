//
//  ViewController.m
//  UIScrollView
//
//  Created by jitengjiao      on 2017/10/17.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)



@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self scrollview3];
}

//循环滚动
-(void)scrollview3{
    UIScrollView *scrollview3=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 400)];
    scrollview3.contentSize=CGSizeMake(SCREEN_WIDTH*5, 400);
    scrollview3.delegate=self;
    scrollview3.pagingEnabled=true;
    scrollview3.backgroundColor=[UIColor grayColor];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0,0,100, 100)];
    label.backgroundColor=[UIColor yellowColor];
    label.text=@"2";
    [scrollview3 addSubview:label];
    scrollview3.contentOffset=CGPointMake(SCREEN_WIDTH, 0);
    for(int i=0;i<4;i++){
        float labelx=(i+1)*SCREEN_WIDTH;
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(labelx, 0, 100, 100)];
        label.backgroundColor=[UIColor yellowColor];
        label.text=[NSString stringWithFormat:@"%d",i%3];//0 1 2 0
        [scrollview3 addSubview:label];
    }
    
    [self.view addSubview:scrollview3];
    
}

//大图展示
-(void)scrollview2{
//    UIImageView *imageview=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_4800"]];
//    [self.view addSubview:imageview];
//
//    NSLog(@"image:%@",NSStringFromCGSize(imageview.frame.size));
//    NSLog(@"sreen:%@",NSStringFromCGSize([UIScreen mainScreen].bounds.size));
    
    UIScrollView *scrollview2=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 300)];
    scrollview2.contentSize=CGSizeMake(1242, 1242);
    UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1242, 1242)];
    imageview.image=[UIImage imageNamed:@"IMG_4800"];
    scrollview2.backgroundColor=[UIColor grayColor];
    [scrollview2 addSubview:imageview];
    [self.view addSubview:scrollview2];
}

//scrollView
-(void)scrollview1{
    
    UIScrollView *scrollview1=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 200)];
    scrollview1.contentSize=CGSizeMake(SCREEN_WIDTH*5, 200);
    scrollview1.backgroundColor=[UIColor grayColor];
    scrollview1.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    scrollview1.bounces=true;
    scrollview1.pagingEnabled=true;
    scrollview1.scrollEnabled=true;
    scrollview1.delegate=self;
    scrollview1.contentOffset=CGPointMake(SCREEN_WIDTH, 0);
    
    [self.view addSubview:scrollview1];
    
    UILabel *scrollLabel=[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, 50, 50)];
    
    scrollLabel.text=@"你好";
    scrollLabel.textColor=[UIColor redColor];
    scrollLabel.backgroundColor=[UIColor yellowColor];
    scrollLabel.font=[UIFont systemFontOfSize:12.0];
    
    [scrollview1 addSubview:scrollLabel];
    
    NSLog(@"%f",SCREEN_WIDTH);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    float x=scrollView.contentOffset.x;
//    NSLog(@"%f",x);
    float x=scrollView.contentOffset.x;
    if(x==SCREEN_WIDTH*4){
        CGPoint point=CGPointMake(SCREEN_WIDTH, 0);
        scrollView.contentOffset=point;
    }else if(x==0){
        CGPoint point2=CGPointMake(SCREEN_WIDTH*3, 0);
        scrollView.contentOffset=point2;
    }
}

@end
