//
//  SNTableViewHelper.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma public import
#import "SNTableViewHelperManager.h"

@interface SNTableViewHelper : NSObject

@property (nonatomic, weak) UITableView * tableView;

//tableview的数据源
@property (nonatomic, strong) NSMutableArray * sections;

//初始化tableView
+ (instancetype)helperWithTableView:(UITableView *)tableView;

//辅助一个section
- (void)helpSection:(void(^)(SNTableViewSectionHelper * section))sectionBlock;

//辅助复杂的section，以应对杂乱的数据结构
- (void)helpSpecialSection:(void(^)(SNTableViewSectionHelper * section))sectionBlock;

//辅助多个section
- (void)helpSomeSection:(void(^)(SNTableViewSectionHelper * section))sectionBlock;

@end
