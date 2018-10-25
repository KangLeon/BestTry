//
//  ViewController.m
//  NavigationController2
//
//  Created by jitengjiao      on 2017/10/20.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title=@"Main";
    UIBarButtonItem *barbuttonIem1=[[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonSystemItemUndo target:nil action:nil];
    UIBarButtonItem *barbuttonIem2=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonSystemItemUndo target:nil action:nil];
    UIBarButtonItem *barbuttonIem3=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonSystemItemUndo target:nil action:nil];
    UIBarButtonItem *barbuttonIem4=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonSystemItemUndo target:nil action:nil];
        UIBarButtonItem *barbuttonIem5=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonSystemItemUndo target:nil action:nil];
    NSArray *array=[[NSArray alloc] initWithObjects:barbuttonIem1,barbuttonIem2,barbuttonIem3,barbuttonIem4, barbuttonIem5,nil];
    self.navigationItem.leftBarButtonItems=array;
//    self.navigationController.navigationBar.backgroundColor=[UIColor redColor];
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    NSDictionary *dic=[[NSDictionary alloc] initWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes=dic;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
