//
//  ViewController.m
//  PickerView
//
//  Created by jitengjiao      on 2017/10/22.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong) NSArray *array_table;
@property(nonatomic,strong) NSArray *array1;
@property(nonatomic,strong) NSArray *array2;
@property(nonatomic,strong) NSArray *array3;
@property(nonatomic,strong) UIPickerView *myPickerView;

@property (weak, nonatomic) IBOutlet UIButton *order_button;
@property (weak, nonatomic) IBOutlet UILabel *main_label;
@property (weak, nonatomic) IBOutlet UILabel *typelabel;
@property (weak, nonatomic) IBOutlet UILabel *drink_label;

@property(nonatomic,strong) NSString *tableNum;
@property(nonatomic,strong) NSString *mainfood;
@property(nonatomic,strong) NSString *typefood;
@property(nonatomic,strong) NSString *drinkfood;

- (IBAction)order_action:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.array_table=[[NSArray alloc] initWithObjects: @"1号桌",@"2号桌",@"3号桌",nil];
    self.array1=@[@"羊肉火锅",@"菌锅",@"酸菜猪脚火锅"];
    self.array2=@[@"微辣",@"中辣",@"特辣"];
    self.array3=@[@"果汁",@"果粒橙",@"椰子汁",@"可乐"];
    
    self.myPickerView=[[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    
    _myPickerView.delegate=self;
    _myPickerView.dataSource=self;
    [self.view addSubview:_myPickerView];
    
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  4;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==0){
        return _array_table.count;
    }else if (component==1){
        return self.array1.count;
    }else if (component==2){
        return self.array2.count;
    }else if (component==3){
        return self.array3.count;
    }else{
        return 0;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str=nil;
    if(component==0){
        str=[_array_table objectAtIndex:row];
    }else if (component==1){
        str=[self.array1 objectAtIndex:row];
    }else if (component==2){
        str=[self.array2 objectAtIndex:row];
    }else if (component==3){
        str=[self.array3 objectAtIndex:row];
    }
    return str;
}


//这里有一点不好：就是pickerView开始不旋转，直接下单时button上面的文字会显示null
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==0){
        self.tableNum=[self.array_table objectAtIndex:row];//字符串内容赋值
    }else if (component==1){
        self.mainfood=[self.array1 objectAtIndex:row];
    }else if (component==2){
        self.typefood=[self.array2 objectAtIndex:row];
    }else if (component==3){
        self.drinkfood=[self.array3 objectAtIndex:row];
    }
}

- (IBAction)order_action:(UIButton *)sender {
    [self.order_button setTitle:[NSString stringWithFormat:@"第%@桌",self.tableNum] forState:UIControlStateNormal];
    self.main_label.text=self.mainfood;
    self.typelabel.text=self.typefood;
    self.drink_label.text=self.drinkfood;
}
@end
