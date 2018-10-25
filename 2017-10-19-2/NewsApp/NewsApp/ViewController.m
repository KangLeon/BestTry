//
//  ViewController.m
//  NewsApp
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "TopView.h"
#import "MKConstant.h"
#import "MiddleView.h"
#import "MyButton.h"

@interface ViewController (){
    TopView *topView;
    MiddleView *middleView;
    UIView *searchView;
    UISearchBar *searchBar;
    UIView *nightModel;
    UILabel *nightModelLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addTopView];
//    [self addMiddleView];
//    [self addMybutton];
//    [self addSearchView];
    [self addNightModel];
}

-(void)addNightModel{
    nightModel=[[UIView alloc] initWithFrame:CGRectMake(0, 109, 375, 80)];
    nightModel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    nightModelLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    nightModelLabel.text=@"夜间模式:";
    [nightModel addSubview:nightModelLabel];
    UISwitch *mswitch=[[UISwitch alloc] initWithFrame:CGRectMake(80, (80-31)/2, 51, 31)];
    [mswitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [nightModel addSubview:mswitch];
    
    [self.view addSubview:nightModel];
}

-(void)switchAction:(UISwitch *)mswitch{
    if([mswitch isOn]){
        self.view .backgroundColor=[UIColor blackColor];
        nightModelLabel.textColor=[UIColor whiteColor];
        nightModel.backgroundColor=[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
        topView.backgroundColor=[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
    }else{
        self.view.backgroundColor=[UIColor whiteColor];
        nightModelLabel.textColor=[UIColor blackColor];
        nightModel.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8];
        topView.backgroundColor=[UIColor colorWithRed:138.0/255.0 green:206.0/255.0 blue:245.0/255.0 alpha:1.0];
    }
}

-(void)addSearchView{
    
    UIButton *searchBtn=[[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-55, 15, 30, 30)];
    [searchBtn setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:searchBtn];
    
}

-(void)searchAction{
    searchView=[[UIView alloc] initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT-60)];
    searchView.backgroundColor=[UIColor whiteColor];
    searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    
    [searchView addSubview:searchBar];
    [self.view addSubview:searchView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [searchBar resignFirstResponder];
    if(searchView){
        [searchView removeFromSuperview];
    }
}

-(void)addMybutton{
    self.view.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.7];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 105, SCREEN_WIDTH, 80)];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    
    MyButton *mybutton=[[MyButton alloc] initWithFrame:CGRectMake(0, 0, 60, 80) image:@"电话.png" title:@"电话"];
    [view addSubview:mybutton];
}

-(void)addTopView{
    topView=[[TopView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 64)];
    [topView setTitle:@"慕课网"];
    [self.view addSubview:topView];
}

-(void)addMiddleView{
    middleView=[[MiddleView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, 40+162+140) newsType:@[@"runningman新闻",@"李光洙",@"刘在石",@"HAHA",@"Gary",@"宋智孝"]];
    [self.view addSubview:middleView];
    //image info
    NSDictionary *newsinfo0=[NSDictionary dictionaryWithObjectsAndKeys:@"1.png",@"image",@"iwatch 更自由 更来电",@"info",nil];
    NSDictionary *newsinfo1=[NSDictionary dictionaryWithObjectsAndKeys:@"2.png",@"image",@"iPhone8 新一代iphone",@"info",nil];
    NSDictionary *newsinfo2=[NSDictionary dictionaryWithObjectsAndKeys:@"3.png",@"image",@"iPhone X hello 未来",@"info",nil];
    NSArray *newsInfo=[[NSArray alloc] initWithObjects:newsinfo0,newsinfo1,newsinfo2, nil];
    //数据如何传递
    middleView.newsInfo=newsInfo;
    [middleView addNewsScrollView];
    
    //添加图文混排
    [middleView addMixImageTextFrame:CGRectMake(0, 207, SCREEN_WIDTH, 60) image:@"4.png" title:@"2016年女爱豆热搜榜第四（前三I.O.I包揽），前三的热度从1月份开始，程潇从9月份才开始，今年程潇真的是大势。现在上综艺也不怎么翻跟头了，在丛林里潜水抓鱼剖鱼吃蛇肉，在T&T里穿旗袍演杂技，HT上主持人抛的梗都能很机智的接住，参加的节目经常破收视率记录。虽然这次偶运会只得了第三，不过彩排视频已经突破了50万点击，NAVER实时热搜第一，连去年的球操都被拉上了热门，评论如下图。微博上营销号花式安利，吸了很多路人粉，还虐了一把死忠。塞翁失马，焉知祸福啊。PS：MBC亲妈了一回，虽然事前流出彩排视频但放送量还是最多的，解说员和金炫茂也把难点一一指了出来，夸程潇是在以专业运动员的水准要求自己，搞体育的最喜欢有天赋又肯吃苦的孩子，最后女解说员眼睛都红了。" url:@"https://www.zhihu.com/question/50661051/answer/143243296"];
    [middleView addMixImageTextFrame:CGRectMake(0, 207+65, SCREEN_WIDTH, 60) image:@"5.png" title:@"2016年女爱豆热搜榜第四（前三I.O.I包揽），前三的热度从1月份开始，程潇从9月份才开始，今年程潇真的是大势。现在上综艺也不怎么翻跟头了，在丛林里潜水抓鱼剖鱼吃蛇肉，在T&T里穿旗袍演杂技，HT上主持人抛的梗都能很机智的接住，参加的节目经常破收视率记录。虽然这次偶运会只得了第三，不过彩排视频已经突破了50万点击，NAVER实时热搜第一，连去年的球操都被拉上了热门，评论如下图。微博上营销号花式安利，吸了很多路人粉，还虐了一把死忠。塞翁失马，焉知祸福啊。PS：MBC亲妈了一回，虽然事前流出彩排视频但放送量还是最多的，解说员和金炫茂也把难点一一指了出来，夸程潇是在以专业运动员的水准要求自己，搞体育的最喜欢有天赋又肯吃苦的孩子，最后女解说员眼睛都红了。" url:@"https://www.zhihu.com/question/50661051/answer/143243296"];
}

@end
