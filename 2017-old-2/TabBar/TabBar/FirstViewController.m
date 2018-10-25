//
//  FirstViewController.m
//  TabBar
//
//  Created by jitengjiao      on 2017/9/6.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    //    UIBarButtonItem *returnButtonItem = [[UIBarButtonItem alloc] init];
    //    returnButtonItem.title = @"";
    //    self.navigationItem.backBarButtonItem = returnButtonItem;
    //    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:24.0/255.0 green:180.0/255.0 blue:237.0/255.0 alpha:1.0];
    //
    //    UIButton *addButton=[[UIButton alloc] init];
    //    addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [addButton setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
    //    addButton.frame = CGRectMake(20, 0, 54, 30);
    //    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    //    addButton.titleLabel.font = [UIFont systemFontOfSize:17];
    //    [addButton addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIBarButtonItem	*rigthbuttonitem=[[UIBarButtonItem alloc] initWithCustomView:addButton];
    //    self.navigationItem.rightBarButtonItem=rigthbuttonitem;
    //
    //
    //    self.title=@"家庭成员";
    //    // Do any additional setup after loading the view from its nib.
    //    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    //    // Do any additional setup after loading the view from its nib.
    
    //  自定义视图添加导航栏文字
    //    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    //    titleLabel.backgroundColor = [UIColor grayColor];
    //    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    //    titleLabel.textColor = [UIColor blueColor];
    //    titleLabel.textAlignment = NSTextAlignmentCenter;
    //    titleLabel.text = @"导航栏标题";
    //    self.navigationItem.titleView = titleLabel;
    
    //另外一种设置导航栏字体方法
    //    self.navigationItem.title = @"导航栏标题";

//    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
//    self.navigationController.navigationBar.backgroundColor=[UIColor whiteColor];
//    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
//    self.navigationController.navigationBar.translucent=NO;
    
    
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.title=@"微信";
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:39.0/255.0 green:39.0/255.0 blue:39.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}
- (IBAction)getTicket:(UIBarButtonItem *)sender {
    
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UITabBarController *detailTab=[story instantiateViewControllerWithIdentifier:@"detailTabBar"];
    
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:detailTab animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
