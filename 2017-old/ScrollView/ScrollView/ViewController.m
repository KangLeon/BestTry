//
//  ViewController.m
//  ScrollView
//
//  Created by jitengjiao      on 2017/9/4.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //scrollview
    self.myScrollView.pagingEnabled=YES;
    self.myScrollView.scrollEnabled=YES;
    self.myScrollView.bounces=YES;
    self.myScrollView.alwaysBounceHorizontal=YES;
    self.myScrollView.alwaysBounceVertical=NO;
    self.myScrollView.showsHorizontalScrollIndicator=YES;
    self.myScrollView.showsVerticalScrollIndicator=NO;
    self.myScrollView.backgroundColor=[UIColor yellowColor];
    self.myScrollView.contentSize=CGSizeMake(414*3, 193);
    self.myScrollView.delegate=self;
    
    for(int i=0;i<3;i++){
        NSString *strName=[NSString stringWithFormat:@"%d.png",i+1];
        
        UIImage *image=[UIImage imageNamed:strName];
        
        UIImageView* iView=[[UIImageView alloc] initWithImage:image];
        
        iView.frame=CGRectMake(414*i, 0, 414, 193);
        
        [self.myScrollView addSubview:iView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
