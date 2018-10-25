//
//  ViewController.m
//  SettingsDemo
//
//  Created by jitengjiao      on 2017/10/24.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myTextField.delegate=self;
    [self loadPreference];
}

-(void)loadPreference{
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *textString=[userDefault objectForKey:@"textKey"];
    self.myTextField.text=textString;
    
    BOOL switchValue=[userDefault boolForKey:@"switchKey"];
    self.mySwitch.on=switchValue;
    
    float sliderValue=[userDefault floatForKey:@"sliderKey"];
    self.mySlider.value=sliderValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"字符串变为：%@",textField.text);
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault setObject:textField.text forKey:@"textKey"];
    [userDefault synchronize];
}

- (IBAction)switchAction:(UISwitch *)sender {
    NSLog(@"开关变为：%d",sender.isOn);
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault setBool:sender.isOn forKey:@"switchKey"];
    [userDefault synchronize];
}
- (IBAction)sliderAction:(UISlider *)sender {
    NSLog(@"滑块变为：%f",sender.value);
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault setFloat:sender.value forKey:@"sliderKey"];
    [userDefault synchronize];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.myTextField resignFirstResponder];
}

@end
