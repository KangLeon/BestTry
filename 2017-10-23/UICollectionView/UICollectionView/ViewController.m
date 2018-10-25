//
//  ViewController.m
//  UICollectionView
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    UICollectionView *myCollectionView;
}

@property(nonatomic,strong) NSMutableArray *array_color;
@property(nonatomic,strong) UIColor* color_copy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //实例化
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    //每个item的size
    layout.itemSize=CGSizeMake(130, 130);
    //头和尾
    layout.headerReferenceSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
    layout.footerReferenceSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 20);

    //滑动方向
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    myCollectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    myCollectionView.backgroundColor=[UIColor whiteColor];
    
    myCollectionView.dataSource=self;
    myCollectionView.delegate=self;
    
    //注册id
    [myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    
    //注册头和尾的id
    [myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    [myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"];
    [self.view addSubview:myCollectionView];

    self.array_color=[[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        [self.array_color addObject:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]];
    }
    
    
    //长按手势控制对象
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlerlong:)];
    [myCollectionView addGestureRecognizer:longPress];
}

//下面代码注释了，因为这个功能和那些代码冲突
-(void)handlerlong:(UILongPressGestureRecognizer *)longPress{
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:{
            //找到item
            //点击在什么位置
            NSIndexPath *indexPath=[myCollectionView indexPathForItemAtPoint:[longPress locationInView:myCollectionView]];
            if (indexPath==nil) {
                break;
            }
            //开启移动
            [myCollectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:{
            [myCollectionView updateInteractiveMovementTargetPosition:[longPress locationInView:myCollectionView]];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            //关闭当前的移动
            [myCollectionView endInteractiveMovement];
        }
            break;
        default:
            [myCollectionView cancelInteractiveMovement];
            break;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array_color.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    
//    //生成随机颜色
//    UIColor *color=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    
    UIColor *color=[self.array_color objectAtIndex:indexPath.row];
    cell.backgroundColor=color;
    
    return cell;
}

////同时支持head和foot
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
//        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
//        if (header==nil) {
//            header=[[UICollectionReusableView alloc] init];
//        }
//        header.backgroundColor=[UIColor redColor];
//        return header;
//    }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
//        UICollectionReusableView *footer=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"foot" forIndexPath:indexPath];
//        if (footer==nil) {
//            footer=[[UICollectionReusableView alloc] init];
//        }
//        footer.backgroundColor=[UIColor blueColor];
//        return footer;
//    }else{
//        return nil;
//    }
//}
//
//
////选中，删除
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    //拿到当前的cell对象
//    UICollectionViewCell *cell=[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor=[UIColor grayColor];
//    //删除(以下代码会报错，可能与其他部分冲突)
//    [self.array_color removeObjectAtIndex:indexPath.row];
//    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
//}
//
////复制，粘贴
////1.长按
//-(BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return true;
//}
//
//-(BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
//    // action 到底是哪个方法
//    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"]) {
//        return true;
//    }
//    return false;
//}
//
////操作
//-(void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
//    if ([NSStringFromSelector(action) isEqualToString:@"copy:"]) {
//        self.color_copy=[self.array_color objectAtIndex:indexPath.row];
//    }else if ([NSStringFromSelector(action) isEqualToString:@"paste:"]){
//        if (self.color_copy!=nil) {
//            [self.array_color insertObject:self.color_copy atIndex:indexPath.row];
//            self.color_copy=nil;
//            [collectionView insertItemsAtIndexPaths:@[indexPath]];
//        }
//    }
//}


//item任意位置的拖动
//1.item使能 2.刷新 3.手势控制
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    UIColor *souceColor=[self.array_color objectAtIndex:sourceIndexPath.item];
    //假如从数组中取出来，但又不知道类型的话可以使用id类型
//    id obj=[self.array_color objectAtIndex:sourceIndexPath.item];
    
    [self.array_color removeObject:souceColor];
    [self.array_color insertObject:souceColor atIndex:destinationIndexPath.item];;
}



@end
