//
//  MyPicture.h
//  ScrollView
//
//  Created by jitengjiao      on 2017/9/4.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPicture : NSObject

@property(copy,nonatomic)NSMutableArray *picturesName;

+(instancetype)sharedPictures;

@end
