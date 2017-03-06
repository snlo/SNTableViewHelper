//
//  SNTableViewDataSource.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//配置cell的块
typedef void(^ConfigCellBlock)(id cell, id data, NSIndexPath * indexPath, UITableView * tableView);

@class SNTableViewDataSourceSection;

@interface SNTableViewDataSource : NSObject <UITableViewDataSource>

//tableview的数据源
@property (nonatomic, strong) NSMutableArray <SNTableViewDataSourceSection *> * sections;

@end
