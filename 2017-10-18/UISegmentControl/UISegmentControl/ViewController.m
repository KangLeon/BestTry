//
//  ViewController.m
//  UISegmentControl
//
//  Created by jitengjiao      on 2017/10/18.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>{
    UITextView *textview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self textview];
}

-(void)textview{
    textview=[[UITextView alloc] initWithFrame:CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, 250)];
    textview.textColor=[UIColor blackColor];
    textview.font=[UIFont systemFontOfSize:18.0];
    textview.delegate=self;
    textview.text=@"2015年12月22日，程潇随宇宙少女与Melody Day组合合作翻唱圣诞歌曲.12月28日，与组合成员秋所静、孙珠妍等和UNIQ组合合作演唱新年主题单曲.2016年2月20日，程潇随宇宙少女在KT“GIGA Legend Match”进行出道前的首次公演.随宇宙少女推出第三张迷你专辑.韩国获得Mnet排行榜第一名、Olleh MV排行榜第三位的好成绩.程潇与朴珍荣、王嘉尔、朴素丹、金珉载合作拍摄了一组名为“Adopt me（收留我）”的公益写真，为流浪小动物的领养事业作出贡献，并号召公众领养代替购买动物.2015年12月22日，程潇随宇宙少女与Melody Day组合合作翻唱圣诞歌曲.12月28日，与组合成员秋所静、孙珠妍等和UNIQ组合合作演唱新年主题单曲.2016年2月20日，程潇随宇宙少女在KT“GIGA Legend Match”进行出道前的首次公演.随宇宙少女推出第三张迷你专辑.韩国获得Mnet排行榜第一名、Olleh MV排行榜第三位的好成绩.程潇与朴珍荣、王嘉尔、朴素丹、金珉载合作拍摄了一组名为“Adopt me（收留我）”的公益写真，为流浪小动物的领养事业作出贡献，并号召公众领养代替购买动物.2015年12月22日，程潇随宇宙少女与Melody Day组合合作翻唱圣诞歌曲.12月28日，与组合成员秋所静、孙珠妍等和UNIQ组合合作演唱新年主题单曲.2016年2月20日，程潇随宇宙少女在KT“GIGA Legend Match”进行出道前的首次公演.随宇宙少女推出第三张迷你专辑.韩国获得Mnet排行榜第一名、Olleh MV排行榜第三位的好成绩.程潇与朴珍荣、王嘉尔、朴素丹、金珉载合作拍摄了一组名为“Adopt me（收留我）”的公益写真，为流浪小动物的领养事业作出贡献，并号召公众领养代替购买动物";
    
    textview.scrollEnabled=true;
    
    [self.view addSubview:textview];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [textview resignFirstResponder];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"%@",textView.text);
}

-(void)pageControl{
    UIPageControl *pagecontrol=[[UIPageControl alloc] initWithFrame:CGRectMake(0, 160, [UIScreen mainScreen].bounds.size.width, 20)];
    pagecontrol.numberOfPages=10;
    pagecontrol.currentPage=3;
    pagecontrol.backgroundColor=[UIColor grayColor];

    [self.view addSubview:pagecontrol];
    
}

-(void)segment{
    NSMutableArray *segmentitemarray=[NSMutableArray arrayWithCapacity:5];
    for (int i=1; i<5; i++) {
        NSString *imageString=[NSString stringWithFormat:@"%d.png",i];
        UIImage *segmentimage=[UIImage imageNamed:imageString];
        [segmentitemarray addObject:segmentimage];
    }
    UISegmentedControl *segment=[[UISegmentedControl alloc] initWithItems:segmentitemarray];
    segment.frame=CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width/2, 30);
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
}

-(void)segmentAction:(UISegmentedControl *)msegment{
    
    NSLog(@"%ld",(long)[msegment selectedSegmentIndex]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
