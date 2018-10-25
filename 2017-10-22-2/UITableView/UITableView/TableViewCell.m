//
//  TableViewCell.m
//  UITableView
//
//  Created by jitengjiao      on 2017/10/22.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TableViewCell


+(instancetype)createCellWithTableView:(UITableView *)tableView{
    static NSString *id=@"reuse";
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
    if(cell==nil){
        //通过xib方式加载进来
        cell=[[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil] lastObject];
    }
    return  cell;
}

-(void)loadData:(NSString *)image label:(NSString *)label{
    self.imageView.image=[UIImage imageNamed:image];
    self.label.text=label;
}

//初始化的一些代码
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.label.textColor=[UIColor yellowColor];
}

//配置cell被选中的view信息
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    self.backgroundColor=[UIColor grayColor];

}

@end
