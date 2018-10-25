//
//  ViewController.m
//  File
//
//  Created by jitengjiao      on 2017/9/2.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property(strong,nonatomic) NSString *stringPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self writeSomething];
    [self savePhoto];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)savePhoto{

    NSString *urlString=@"https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=c1d5f05445c2d562e605d8bf8678fb8a/c995d143ad4bd1130b1de90650afa40f4bfb0535.jpg";
    
    NSURL *imageUrl=[NSURL URLWithString:urlString];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:imageUrl];
    
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *datatask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if(error==nil){
            
            NSArray *docPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *docPath=[docPaths lastObject];
            NSString *testPath=[docPath stringByAppendingPathComponent:@"文件名"];
            NSString *name=[testPath stringByAppendingPathComponent:@"我的笔记.png"];
            
            self.stringPath=name;
            
            [data writeToFile:name atomically:YES];
            
            NSLog(@"%@",name);
            
        }
      //回到主线程中显示
//        dispatch_async(dispatch_get_main_queue(), ^{
//        
//            self.myImageView.image=[UIImage imageWithData:data];
//            
//        });
//        
//        
        
    }];
    [datatask resume];
    
}

-(void)writeSomething
{
    NSArray *docPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath=[docPaths lastObject];
    NSString *testPath=[docPath stringByAppendingPathComponent:@"文件名"];
    
    NSString *filePath=[testPath stringByAppendingPathComponent:@"我的笔记.png"];
    
    
    NSFileManager *manager=[NSFileManager defaultManager];
    BOOL ret=[manager createFileAtPath:filePath contents:nil attributes:nil];
    if (ret) {
        NSLog(@"文件创建成功");
        NSLog(@"%@",filePath);
    }else{
        NSLog(@"文件创建失败");
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSFileManager *manager=[NSFileManager defaultManager];
    
    
    if([manager fileExistsAtPath:self.stringPath]){
        NSLog(@"exit");
    }else{
        NSLog(@"not exit");
    }
    
    NSData *imageData=[NSData dataWithContentsOfFile:self.stringPath];
    UIImage *image=[UIImage imageWithData:imageData];
    self.myImageView.image=image;
    
}


@end
