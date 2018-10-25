//
//  ViewController.m
//  NavigationControll
//
//  Created by jitengjiao      on 2017/10/19.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface ViewController (){
    FirstViewController *firstVC;
    SecondViewController *secondVC;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //两个都可以改变导航栏的标题，但是两者修改的地方时不一样的,
    self.navigationItem.title=@"Main";
////    self.title=@"Main";
    
//    //设置TitleView，这样就可以自定义titleView了
//    self.navigationItem.titleView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
//    self.navigationItem.titleView.backgroundColor=[UIColor grayColor];
//
//    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
//    [btn setTitle:@"背景" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.navigationItem.titleView addSubview:btn];
    
    UIButton *button1=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
    [button1 setTitle:@"Push1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:button1];
    
    
    UIButton *button2=[[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 60)];
    [button2 setTitle:@"Push2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    self.view.tag=10000;
    
    //工具栏
    [self.navigationController setToolbarHidden:false];
    [self.navigationController setNavigationBarHidden:true];

    UIBarButtonItem *butItem1=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(buttonAction)];
    UIBarButtonItem *butItem2=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(buttonAction2)];
    UIImage *image=[UIImage imageNamed:@"wx.png"];
    UIImage *renderImage=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *butItem3=[[UIBarButtonItem alloc] initWithImage:renderImage style:UIBarButtonSystemItemUndo target:self action:@selector(buttonAction2)];
    UIBarButtonItem *butItem4=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:@selector(buttonAction)];
    butItem4.width=80;
    UIBarButtonItem *butItem5=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(buttonAction)];
    
    NSArray *itemarray=[[NSArray alloc] initWithObjects:butItem1,butItem4,butItem2,butItem5,butItem3, nil];
    [self setToolbarItems:itemarray];
    
    
}

-(void)buttonAction{
    if(firstVC==nil){
            firstVC=[[FirstViewController alloc] init];
    }
    [self.navigationController pushViewController:firstVC animated:true];
}

-(void)buttonAction2{
    if(secondVC==nil){
        secondVC=[[SecondViewController alloc] init];
    }
    [self.navigationController pushViewController:secondVC animated:true];
}

-(void)btnAction{
    self.view.backgroundColor=[UIColor yellowColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
