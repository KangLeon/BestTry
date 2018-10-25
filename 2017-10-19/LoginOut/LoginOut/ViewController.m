//
//  ViewController.m
//  LoginOut
//
//  Created by jitengjiao      on 2017/10/19.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "LoginOutViewController.h"
@interface ViewController (){
    LoginOutViewController *vc;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *bt=[[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 60)];
    [bt setTitle:@"登录" forState:UIControlStateNormal];
    [bt setBackgroundColor:[UIColor blueColor]];
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bt];
}

-(void)Login{
    vc=[[LoginOutViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
