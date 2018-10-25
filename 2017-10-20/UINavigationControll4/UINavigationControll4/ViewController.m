//
//  ViewController.m
//  UINavigationControll4
//
//  Created by jitengjiao      on 2017/10/20.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@property(nonatomic,strong) FirstViewController *firstVc;
- (IBAction)buttonAction:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonAction:(UIButton *)sender {
    if(_firstVc==nil){
        _firstVc=[[FirstViewController alloc] init];
        [self presentViewController:_firstVc animated:true completion:nil];
    }else{
         [self presentViewController:_firstVc animated:true completion:nil];
    }
}
@end
