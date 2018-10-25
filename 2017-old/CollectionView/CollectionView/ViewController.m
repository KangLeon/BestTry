//
//  ViewController.m
//  CollectionView
//
//  Created by jitengjiao      on 2017/9/4.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "MyPicture.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong) MyPicture *mypicture;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = 8;
    //最小两行之间的间距
    layout.minimumLineSpacing = 10;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(20, 87, 374, 170) collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    //这个是横向滑动
    //layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    [self.view addSubview:_collectionView];
    
    /*
     *这是重点 必须注册cell
     */
    //这种是xib建的cell 需要这么注册
    UINib *cellNib=[UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    
    
    //这种是自定义cell不带xib的注册
    //   [_collectionView registerClass:[CollectionViewCell1 class] forCellWithReuseIdentifier:@"myheheIdentifier"];
    //这种是原生cell的注册
    //    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
//    //这是头部与脚部的注册
//    UINib *cellNib1=[UINib nibWithNibName:@"CollectionReusableView" bundle:nil];
//    [_collectionView registerNib:cellNib1 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionReusableView"];
//    [_collectionView registerNib:cellNib1 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionReusableView"];
    
    self.mypicture=[MyPicture sharedPictures];
    
    self.mypicture.picturesName=[NSMutableArray arrayWithObjects:@"霾.png",@"暴风雨-1.png",@"暴风雨.png",@"多云.png",@"冬天.png",@"风-1.png",@"风.png",@"风向袋.png",@"霾-1.png",nil];
    
}



////一共有多少个组
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mypicture.picturesName.count;
}
//每一个cell是什么
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    NSString *imageStr=[NSString stringWithFormat:@"%@",self.mypicture.picturesName[indexPath.row]];
    NSString *nameStr=[imageStr stringByReplacingOccurrencesOfString:@".png" withString:@""];
    
    cell.label.text=[NSString stringWithFormat:@"%@",nameStr];
    
    cell.imageView.image=[UIImage imageNamed:imageStr];
    
    cell.backgroundColor=[UIColor groupTableViewBackgroundColor];
    return cell;
}

//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}


////头部和脚部的加载
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    UICollectionReusableView *view=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionReusableView" forIndexPath:indexPath];
//    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(110, 20, 100, 30)];
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        label.text=@"头";
//    }else{
//        label.text=@"脚";
//    }
//    [view addSubview:label];
//    return view;
//}
////每一个分组的上左下右间距
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}
////头部试图的大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    return CGSizeMake(50, 60);
//}
////脚部试图的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(50, 60);
//}

////cell的点击事件
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    //cell被电击后移动的动画
//    [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionTop];
//}
@end
