//
//  SecondViewController.m
//  NavigationControll
//
//  Created by jitengjiao      on 2017/10/19.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"Second";
    self.view.backgroundColor=[UIColor greenColor];
    
    
    UIButton *button3=[[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 60)];
    [button3 setTitle:@"PopToRoot" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}

-(void)popAction{
//    [self.navigationController popToRootViewControllerAnimated:true];
    
    
//    NSArray *viewControllers=self.navigationController.viewControllers;
//    for (UIViewController *item in viewControllers) {
//        if(item.view.tag==10000){
//            [self.navigationController popToViewController:item animated:YES];
//        }
//    }
    
    UIViewController *topVC=self.navigationController.topViewController;
    topVC.view.backgroundColor=[UIColor blueColor];
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor=[UIColor greenColor];
    
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
