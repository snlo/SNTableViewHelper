//
//  SNTableViewDataSource.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <objc/runtime.h>
#import "SNTableViewDataSource.h"

#import "SNTableViewHelperManager.h"

#import "ViewCell.h"

@implementation SNTableViewDataSource

- (NSMutableArray<SNTableViewDataSourceSection *> *)sections {
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setSections:(NSMutableArray<SNTableViewDataSourceSection *> *)sections {
    objc_setAssociatedObject(self,@selector(sections),sections,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -- UITableViewDataSource

#pragma required method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].dataSection.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ViewCell * cell = [self.sections[indexPath.section].cell nibCellWithTabelView:tableView];
    
    ConfigCellBlock configCellBlock = self.sections[indexPath.section].configcell;
    
    id data = self.sections[indexPath.section].dataSection[indexPath.row];
    
    if (configCellBlock) {
        configCellBlock(cell, data, indexPath.row);
    }
    
    return cell;
}

#pragma optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

//- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"header title";
//}
//- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    return @"footer title";
//}

@end
