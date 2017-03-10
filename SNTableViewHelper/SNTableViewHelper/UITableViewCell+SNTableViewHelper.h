//
//  UITableViewCell+SNTableViewHelper.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SNTableViewHelper)

/**
 加载Nib创建的cell
 */
+ (instancetype)nibCellWithTabelView:(UITableView *)tabelView;


/**
 加载非Nib创建的cell
 */
+ (instancetype)cellWithTabelView:(UITableView *)tabelView;


/**
 分割线视图
 */
@property (nonatomic, strong) UIImageView * snt_separatorView;

/**
 是否展示分割线，默认为否
 */
@property (nonatomic, assign) BOOL is_snt_separator;

/**
 分割线距离左边缘的距离，默认为‘0’
 */
@property (nonatomic, assign) CGFloat snt_separatorX;

/**
 分割线的宽度，默认为屏幕宽
 */
@property (nonatomic, assign) CGFloat snt_separatorWidth;

@end

@interface UIImage (SNTableViewHelper)


/**
 通过颜色创建图片
 */
+ (UIImage *)snt_imageWithColor:(UIColor *)color;

@end
