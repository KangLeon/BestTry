//
//  FirstViewController.m
//  NavigationControll
//
//  Created by jitengjiao      on 2017/10/19.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController (){
    SecondViewController *secondVC;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"First1";
    self.view.backgroundColor=[UIColor yellowColor];
    
    UIButton *button2=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
    [button2 setTitle:@"Push2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3=[[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 60)];
    [button3 setTitle:@"pop" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    //系统样式的BarButtonITem
//    UIBarButtonItem *barbuttonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(popAction)];
    
    //自定义标题样式的BarButtonItem
//    UIBarButtonItem *barbuttonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(popAction)];
    
    //自定义View添加BarButtonItem
//    UIView *itemView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
//    itemView.backgroundColor=[UIColor greenColor];
//    UIBarButtonItem *barbuttonItem=[[UIBarButtonItem alloc] initWithCustomView:itemView];
    
    //图片样式方式添加BarButtonItem
    UIImage *image=[UIImage imageNamed:@"wx.png"];
    UIImage *renderImage=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *barbuttonItem=[[UIBarButtonItem alloc] initWithImage:renderImage style:UIBarButtonItemStyleDone target:self action:@selector(popAction)];
    
    self.navigationItem.leftBarButtonItem=barbuttonItem;
    
}

-(void)buttonAction{
    if(secondVC==nil){
        secondVC=[[SecondViewController alloc] init];
    }
    [self.navigationController pushViewController:secondVC animated:true];
}

-(void)popAction{
    [self.navigationController popViewControllerAnimated:true];
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
