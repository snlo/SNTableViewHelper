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
typedef void(^SelectBlock)(NSUInteger row, id data, UITableView * tableView);

typedef void(^HeaderviewBlock)(UIView * headerView, NSUInteger section);
typedef void(^FooterViewBlock)(UIView * footerView, NSUInteger section);

@interface SNTableViewDelegate : NSObject <UITableViewDelegate>

//tableview的数据源
@property (nonatomic, strong) NSMutableArray <SNTableViewDataSourceSection *> * sections;

@end
