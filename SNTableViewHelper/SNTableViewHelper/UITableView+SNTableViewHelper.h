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

- (void)sn_helpTableView:(void(^)(SNTableViewHelper * helper))helper;

- (void)sn_helpDataSource:(void(^)(SNTableViewSectionHelper * helper))helper;

@end
