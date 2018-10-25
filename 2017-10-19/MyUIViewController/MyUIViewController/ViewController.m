//
//  ViewController.m
//  MyUIViewController
//
//  Created by jitengjiao      on 2017/10/19.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIView *view;
    NSArray *array_color;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.
//
//    view=[[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    [self.view addSubview:view];
//
//    array_color=[[NSArray alloc] initWithObjects:[UIColor colorWithRed:255.0/255.0 green:127.0/255.0 blue:29.0/255.0 alpha:1.0],[UIColor colorWithRed:138.0/255.0 green:206.0/255.0 blue:245.0/255.0 alpha:1.0],[UIColor colorWithRed:216.0/255.0 green:114.0/255.0 blue:213.0/255.0 alpha:1.0],[UIColor colorWithRed:178.0/255.0 green:163.0/255.0 blue:111.0/255.0 alpha:1.0], nil];
    
    UIApplication *app=[UIApplication sharedApplication];
    app.networkActivityIndicatorVisible=true;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    int index=arc4random()%3;//产生随机数对3取余
//    UIColor *color=[array_color objectAtIndex:index];
//    view.backgroundColor=color;
    
//    //设置右上角提示数
//    UIApplication *app=[UIApplication sharedApplication];
//    app.applicationIconBadgeNumber=9;
}

//重写方法：隐藏当前的状态栏，true是状态栏隐藏
-(BOOL)prefersStatusBarHidden{
    return false;
}
//重写方法：状态栏的颜色风格
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
