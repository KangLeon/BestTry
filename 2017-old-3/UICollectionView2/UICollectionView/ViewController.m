//
//  ViewController.m
//  UICollectionView
//
//  Created by Jones on 10/16/16.
//  Copyright © 2016 Jones. All rights reserved.
//
// UICollectionView = UItableView + cell 非固定 item
// head cell foot : 颜色 内容 高度
// 1  Size 注册 一个共同
#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    NSMutableArray *array_color;
    UIColor *color_copy;
    UICollectionView *mcollectionView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    array_color = [[NSMutableArray alloc]init];
    for (int i = 0; i<10; i++) {
        [array_color addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]];
    }
    
    // 实例化
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // item size: item head foot
    layout.itemSize = CGSizeMake(130, 130);
    layout.headerReferenceSize = CGSizeMake(414, 50);
    layout.footerReferenceSize = CGSizeMake(414, 20);
    // 方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    mcollectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    mcollectionView.delegate = self;
    mcollectionView.dataSource = self;
    [mcollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"www.imooc.com.cv"];
    [mcollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"www.imooc.com.head"];
    [mcollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"www.imooc.com.foot"];
    [self.view addSubview:mcollectionView];
    // 手势长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handlelong:)];
    [mcollectionView addGestureRecognizer:longPress];
}
-(void)handlelong:(UILongPressGestureRecognizer*)longPress{
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:{
            // 找到item index
            // 点击在什么位置
            NSIndexPath *indexPath = [mcollectionView indexPathForItemAtPoint:[longPress locationInView:mcollectionView]];
            if(indexPath == nil){
                break;
            }
            // 开始移动
            [mcollectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
                
        }
            
            break;
        case UIGestureRecognizerStateChanged:{
            // 更新
            [mcollectionView updateInteractiveMovementTargetPosition:[longPress locationInView:mcollectionView]];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            // 关闭 移动
            [mcollectionView endInteractiveMovement];
        }
            break;
        default:
            [mcollectionView cancelInteractiveMovement];
            break;
    }
}
// 1 组
//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return array_color.count;
}
// 3 item 内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"www.imooc.com.cv" forIndexPath:indexPath];
    // arc4random: 数据 
    UIColor *color = [array_color objectAtIndex:indexPath.row];
    cell.backgroundColor = color;
    return cell;
}
/*
// 4 head foot：collectionView kind：head foot indexPath
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"www.imooc.com.head" forIndexPath:indexPath];
        if (headerView == nil) {
            headerView = [[UICollectionReusableView alloc]init];
        }
        headerView.backgroundColor = [UIColor redColor];
        return headerView;
        
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"www.imooc.com.foot" forIndexPath:indexPath];
        if (footView == nil) {
            footView = [[UICollectionReusableView alloc]init];
        }
        footView.backgroundColor = [UIColor blueColor];
        return footView;
    }else{
        return nil;
    }
    
}
// 5 选中 删除
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //  选中
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    //  删除
    [array_color removeObjectAtIndex:indexPath.row];
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}
// 6 copy
// 6.1 长按 菜单 6.2 使能 6.3 操作
-(BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}
// 6.2 使能
-(BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    // action 到底是哪个方法
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"]) {
        return true;
    }
    return false;
}
// 6.3 操作
-(void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"]) {
        color_copy = [array_color objectAtIndex:indexPath.row];
    }else if ([NSStringFromSelector(action) isEqualToString:@"paste:"]){
        if (color_copy != nil) {
            [array_color insertObject:color_copy atIndex:indexPath.row];
            color_copy = nil;
            [collectionView insertItemsAtIndexPaths:@[indexPath]];
        }
    }
}*/
// 7 item 任意位置
// 7.1 item 使能 7.2 刷新 7.3 手势控制
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    id obj = [array_color objectAtIndex:sourceIndexPath.item];
    [array_color removeObject:obj];
    [array_color insertObject:obj atIndex:destinationIndexPath.item];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
