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

@end
