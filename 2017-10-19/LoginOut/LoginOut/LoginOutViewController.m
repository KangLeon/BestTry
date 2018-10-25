//
//  LoginOutViewController.m
//  LoginOut
//
//  Created by jitengjiao      on 2017/10/19.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "LoginOutViewController.h"
#import "AppDelegate.h"

@interface LoginOutViewController ()

@end

@implementation LoginOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *bt=[[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 60)];
    [bt setTitle:@"退出" forState:UIControlStateNormal];
    [bt setBackgroundColor:[UIColor blueColor]];
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(Out) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bt];
}

-(void)Out{
    AppDelegate *appdelegate=[[UIApplication sharedApplication] delegate];
    
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc=[storyboard instantiateInitialViewController];
    
    appdelegate.window.rootViewController=vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
