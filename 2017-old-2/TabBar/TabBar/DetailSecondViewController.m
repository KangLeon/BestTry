//
//  DetailSecondViewController.m
//  TabBar
//
//  Created by jitengjiao      on 2017/9/7.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "DetailSecondViewController.h"

@interface DetailSecondViewController ()

@end

@implementation DetailSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:39.0/255.0 green:39.0/255.0 blue:39.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIButton *backButton=[[UIButton alloc] init];
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    backButton.frame = CGRectMake(20, 0, 54, 30);
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [backButton addTarget:self action:@selector(bankBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem	*leftbuttonitem=[[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem=leftbuttonitem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)bankBtn:(UIButton *)sender{
    
    [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];
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
