//
//  FirstViewController.m
//  UINavigationControll4
//
//  Created by jitengjiao      on 2017/10/20.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor grayColor];
    UIButton *bt=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
    [bt setTitle:@"消失" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}

-(void)buttonAction{
    [self dismissViewControllerAnimated:true completion:^(){
        NSLog(@"Dismiss");
    }];
}

@end
