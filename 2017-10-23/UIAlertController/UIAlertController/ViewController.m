//
//  ViewController.m
//  UIAlertController
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIAlertController *alertcontroller;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self alert];
    [self actionsheet];
}

-(void)alert{
    self.alertcontroller=[UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *butAction=[UIAlertAction actionWithTitle:@"但是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"但是按钮被点击");
    }];
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    [self.alertcontroller addAction:cancelAction];
    [self.alertcontroller addAction:okAction];
    [self.alertcontroller addAction:butAction];
    [self presentViewController:self.alertcontroller animated:true completion:nil];
}

-(void)login{
    self.alertcontroller=[UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    [self.alertcontroller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"登录";
    }];
    [self.alertcontroller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"密码";
        textField.secureTextEntry=true;
    }];
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *login=self.alertcontroller.textFields.firstObject;
        UITextField *password=self.alertcontroller.textFields.lastObject;
        NSLog(@"%@  %@",login.text,password.text);
    }];
    [self.alertcontroller addAction:okAction];
    [self presentViewController:self.alertcontroller animated:true completion:nil];
}

-(void)actionsheet{
    self.alertcontroller=[UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *butAction=[UIAlertAction actionWithTitle:@"但是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"但是按钮被点击");
    }];
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    [self.alertcontroller addAction:cancelAction];
    [self.alertcontroller addAction:okAction];
    [self.alertcontroller addAction:butAction];
    [self presentViewController:self.alertcontroller animated:true completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
