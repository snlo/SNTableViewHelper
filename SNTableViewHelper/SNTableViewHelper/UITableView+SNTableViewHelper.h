//
//  UITableView+SNTableViewHelper.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SNTableViewHelper;
@class SNTableViewSectionHelper;

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

@end
