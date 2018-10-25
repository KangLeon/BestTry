//
//  ViewController.m
//  UICollectionView瀑布流
//
//  Created by Jones on 10/18/16.
//  Copyright © 2016 Jones. All rights reserved.
//
// 1 M 2 V  3 C 
#import "ViewController.h"
#import "MyImage.h"
#import "MyCollectionViewCell.h"
#import "MyCollectionViewLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,MyCollectionViewLayoutDelegate>{
    NSMutableArray *sourceData;
    UICollectionView *mcollectionView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sourceData = [[NSMutableArray alloc]init];
    NSArray *array_height = @[@"275",@"300",@"270",@"265",@"270",@"354"];
    for (int i = 0; i<6; i++) {
        MyImage *mImage = [[MyImage alloc]init];
        mImage.image = [NSString stringWithFormat:@"%d.jpg",i];
        NSString *height = [array_height objectAtIndex:i];
        mImage.height = height.floatValue;
        mImage.width = 200;
        [sourceData addObject:mImage];
    }
    
    MyCollectionViewLayout *layout = [[MyCollectionViewLayout alloc]init];
    layout.delegate = self;
    mcollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20) collectionViewLayout:layout];
    mcollectionView.dataSource = self;
    mcollectionView.delegate = self;
    
    mcollectionView.backgroundColor = [UIColor whiteColor];
    [mcollectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"www.imooc.com.cv"];
    [self.view addSubview:mcollectionView];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [MyCollectionViewCell createCellWithCollectionView:collectionView indexPath:indexPath];
    MyImage *item = [sourceData objectAtIndex:indexPath.row];
    [cell loadData:item];
    return cell;
}
-(float)getCellH:(float)width index:(int)index{
    MyImage *item = [sourceData objectAtIndex:index];
    return width*item.height/item.width;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
