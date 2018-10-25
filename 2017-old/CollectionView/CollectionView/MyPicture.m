//
//  MyPicture.m
//  ScrollView
//
//  Created by jitengjiao      on 2017/9/4.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "MyPicture.h"

@implementation MyPicture

+(instancetype)sharedPictures{

    static MyPicture *mypictures=nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mypictures=[[MyPicture alloc] init];
    });
    
    return mypictures;
}





@end
