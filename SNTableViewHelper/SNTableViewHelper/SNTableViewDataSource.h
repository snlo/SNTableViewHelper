//
//  SNTableViewDataSource.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void(^cellConfigBlock)(id cell, NSDictionary * data, NSUInteger index);

@class SNTableViewDataSourceSection;

@interface SNTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray <SNTableViewDataSourceSection *> * sections;

@end