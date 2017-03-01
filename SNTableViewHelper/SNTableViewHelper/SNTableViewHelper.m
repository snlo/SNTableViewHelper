//
//  SNTableViewHelper.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "SNTableViewHelper.h"

@implementation SNTableViewHelper

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        self.tableView = tableView;
    }
    return self;
}

+ (instancetype)helperWithTableView:(UITableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}

- (void)helpSection:(void(^)(SNTableViewSectionHelper * section))sectionBlock {
    SNTableViewSectionHelper * sectionHelper = [SNTableViewSectionHelper new];
    sectionBlock(sectionHelper);
    SNLog(@"+++++++ %@",sectionHelper.sectionData.dataSection);
    [self.sections addObject:sectionHelper.sectionData];
}

#pragma mark -- getter

- (NSMutableArray *)sections {
    if (!_sections) {
        _sections = [NSMutableArray new];
    }
    return _sections;
}

@end
