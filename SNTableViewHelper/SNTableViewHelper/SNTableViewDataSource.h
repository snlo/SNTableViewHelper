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
//Select事件块
typedef void(^SelectBlock)(NSUInteger row, id data, UITableView * tableView);

typedef void(^HeaderviewBlock)(UIView * headerView, NSUInteger section);
typedef void(^FooterViewBlock)(UIView * footerView, NSUInteger section);

typedef void(^DidScroll)(UIScrollView * scrollView);

typedef void(^DidEndDragging)(UIScrollView * scrollView, BOOL decelerate);

@class SNTableViewDataSourceSection;

@interface SNTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

//tableview的数据源
@property (nonatomic, strong) NSMutableArray <SNTableViewDataSourceSection *> * sections;

@property (nonatomic, copy) DidScroll didscrollBlock;
@property (nonatomic, copy) DidEndDragging didEndDraggingBlock;

@end
