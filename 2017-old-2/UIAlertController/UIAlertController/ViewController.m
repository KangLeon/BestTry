//
//  ViewController.m
//  UIAlertController
//
//  Created by Jones on 10/23/16.
//  Copyright © 2016 Jones. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIAlertController *alertontroller;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    // title message style
    alertontroller = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    
    [alertontroller addAction:cancelAction];
    [alertontroller addAction:okAction];
    
    [self presentViewController:alertontroller animated:true completion:nil];
     */
    /*
    alertontroller = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    [alertontroller addTextFieldWithConfigurationHandler:^(UITextField *textfield){
        textfield.placeholder = @"登陆";
    }];
    [alertontroller addTextFieldWithConfigurationHandler:^(UITextField *textfield){
        textfield.placeholder = @"密码";
        textfield.secureTextEntry = YES;
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        UITextField *login = alertontroller.textFields.firstObject;
        UITextField *password = alertontroller.textFields.lastObject;
        NSLog(@"%@ %@",login.text,password.text);
    }];
    [alertontroller addAction:okAction];
    [self presentViewController:alertontroller animated:true completion:nil];
     */
    alertontroller = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
    
    [alertontroller addAction:cancelAction];
    [alertontroller addAction:okAction];
    
    [self presentViewController:alertontroller animated:true completion:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
