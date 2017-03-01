//
//  SNTableViewDelegate.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//Select事件块
typedef void(^SelectBlock)(NSUInteger row, id data);

@interface SNTableViewDelegate : NSObject <UITableViewDelegate>

//tableview的数据源
@property (nonatomic, strong) NSMutableArray <SNTableViewDataSourceSection *> * sections;

@end
