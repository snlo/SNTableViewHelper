//
//  UITableView+SNTableViewHelper.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class SNTableViewHelper;
@class SNTableViewSectionHelper;

//cell左滑事件处理
typedef void(^RowActionHandler)(UITableViewRowAction *action, NSIndexPath *indexPath);
typedef void(^HandleRowActionHandler)(UITableView * tableView, UITableViewRowAction *action, NSIndexPath *indexPath);
typedef NSArray <UITableViewRowAction *> * (^ConfigRowActionsBlock)(UITableView *tableView, NSIndexPath * indexPath, RowActionHandler handler);

@interface UITableView (SNTableViewHelper)

/**
 初始化

 @param frame 大小
 @param style 风格
 @param superView 父视图
 @return tableView
 */
+ (instancetype)tabeleViewWithFrame:(CGRect)frame
                              style:(UITableViewStyle)style
                          superView:(UIView *)superView;


/**
 辅助配置tableview

 @param helper 在这里配置，比如 helpSection
 */
- (void)sn_helpTableView:(void(^)(SNTableViewHelper * helper))helper;


/**
 ‘scrollViewDidScroll:’的block形式
 */
- (void)didScroll:(void(^)(UIScrollView * scrollView))didScrollBlock;

/**
 ‘scrollViewDidEndDragging:willDecelerate:’的block形式
 */
- (void)didEndDragging:(void(^)(UIScrollView * scrollerView, BOOL decelerate))didEndDraggingBlock;

- (void)configRowActions:(ConfigRowActionsBlock)block handler:(HandleRowActionHandler)handler;

@end
