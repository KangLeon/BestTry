//
//  TableViewCell.m
//  UITableView
//
//  Created by jitengjiao      on 2017/10/22.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UILabel *label;
@end

@implementation TableViewCell

@synthesize imageView=_imageView;

//cell=cell(创建)+cell(内容加载：添加到view上+内容初始化)
+(instancetype)createCellWithTableView:(UITableView *)tableView{
    static NSString *id=@"reuse";
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
    if(cell==nil){
        //通过纯代码方式加载进来
        cell=[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    return  cell;
}

//改变frame时会发生调用
//但是init方法不会发生调用
//addSubview执行时，会发生调用
-(void)layoutSubviews{
    CGFloat imageX=self.frame.size.width-30-10;
    CGFloat imageY=(self.frame.size.height-30)/2;
    CGFloat imageH=30;
    CGFloat imageW=30;
    self.imageView.frame=CGRectMake(imageX, imageY, imageH, imageW);
    [self addSubview:self.imageView];
    
    CGFloat labelX=10;
    CGFloat labelY=0;
    CGFloat labelW=100;
    CGFloat labelH=self.frame.size.height;
    self.label.frame=CGRectMake(labelX, labelY, labelW, labelH);
    [self addSubview:self.label];
}

//check状态
-(void)setCheckStatus:(BOOL)flag{
    self.selectedFlag=flag;
    if(self.imageView==nil){
        self.imageView=[[UIImageView alloc] init];
    }if(self.selectedFlag){
        self.imageView.image=[UIImage imageNamed:@"checked"];
    }else{
        self.imageView.image=[UIImage imageNamed:@"unchecked"];
    }
}

//label
-(void)setCellText:(NSString *)str{
    if(_label==nil){
        _label=[[UILabel alloc] init];
        _label.text=str;
        _label.textColor=[UIColor blackColor];
        _label.font=[UIFont systemFontOfSize:15.0];
    }
}

//-(void)loadData:(NSString *)image label:(NSString *)label{
//    self.imageView.image=[UIImage imageNamed:image];
//    self.label.text=label;
//}
//
////初始化的一些代码
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//    self.label.textColor=[UIColor yellowColor];
//}
//
////配置cell被选中的view信息
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    // Configure the view for the selected state
//    self.backgroundColor=[UIColor grayColor];
//
//}

@end
