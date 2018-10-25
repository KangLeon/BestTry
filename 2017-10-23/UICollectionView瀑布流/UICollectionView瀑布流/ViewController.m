//
//  ViewController.m
//  UICollectionView瀑布流
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "MyImage.h"
#import "MyCollectionViewCell.h"
#import "MyUICollectionViewLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,MycollectionViewLayoutDelegate>
@property(nonatomic,strong)NSMutableArray *sourceData;
@property(nonatomic,strong)UICollectionView *mcollectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sourceData=[[NSMutableArray alloc] init];
    NSArray *array_height=@[@"275",@"300",@"270",@"265",@"270",@"354"];
    
    for (int i=0;i<6; i++) {
        MyImage *myimage=[[MyImage alloc] init];
        myimage.image=[NSString stringWithFormat:@"%d.jpg",i+1];
        NSString *height=[array_height objectAtIndex:i];
        myimage.height=height.floatValue;
        myimage.width=200;
        [self.sourceData addObject:myimage];
    }
    
    MyUICollectionViewLayout *layout=[[MyUICollectionViewLayout alloc] init];
    layout.delegate=self;
    self.mcollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20) collectionViewLayout:layout];
    self.mcollectionView.dataSource=self;
    self.mcollectionView.delegate=self;
    self.mcollectionView.backgroundColor=[UIColor whiteColor];
    
    [self.mcollectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionviewcell"];
    [self.view addSubview:self.mcollectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.sourceData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell=[MyCollectionViewCell createCellWithCollectionView:collectionView indexPath:indexPath];
    MyImage *item=[self.sourceData objectAtIndex:indexPath.row];
    [cell loadData:item];
    return cell;
}

-(float)getCellH:(float)width index:(int)index{
    MyImage *item=[self.sourceData objectAtIndex:index];
    return width*item.height/item.width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
