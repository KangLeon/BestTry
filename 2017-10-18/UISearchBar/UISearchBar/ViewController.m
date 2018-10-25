//
//  ViewController.m
//  UISearchBar
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()<UISearchBarDelegate>{
    NSArray *scoprArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self searchBar2];
}

//自定义
-(void)searchBar2{
    UISearchBar *searchbar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 50)];
    searchbar.showsScopeBar=true;
    searchbar.showsBookmarkButton=true;
    searchbar.delegate=self;
    
    searchbar.backgroundImage=[UIImage imageNamed:@"1.png"];
    
    [self.view addSubview:searchbar];
}

//searchBar的使用
-(void)searchbar{
    UISearchBar *searchbar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 50)];
    searchbar.showsCancelButton=true;
    searchbar.delegate=self;
    searchbar.showsScopeBar=true;
    scoprArray=@[@"big",@"small"];
    searchbar.scopeButtonTitles=scoprArray;
    [self.view addSubview:searchbar];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"已取消查询");
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"\"%@\"将在数据库中进行搜索",searchBar.text);
    [searchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    NSLog(@"selectedScope:%ld",(long)selectedScope);
    NSLog(@"array:%@",[scoprArray objectAtIndex:selectedScope]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
