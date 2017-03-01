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

- (void)helpSection:(void(^)(SNTableViewSectionHelper * section))sectionBlock;

@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * sections;

+ (instancetype)helperWithTableView:(UITableView *)tableView;

@end
