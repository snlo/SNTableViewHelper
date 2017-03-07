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
    
    UITableViewCell * cell = [UITableViewCell new];
    if (self.sections[indexPath.section].isNibCell) {
        cell = [self.sections[indexPath.section].cell nibCellWithTabelView:tableView];
    } else {
        cell = [self.sections[indexPath.section].cell cellWithTabelView:tableView];
    }
    
    ConfigCellBlock configCellBlock = self.sections[indexPath.section].configCell;
    
    id data = self.sections[indexPath.section].dataSection[indexPath.row];
    
    if (configCellBlock) {
        configCellBlock(cell, data, indexPath, tableView);
    }
    
    if (cell.is_snt_separator) {
        if (indexPath.row == 0) {
            cell.snt_separatorView.backgroundColor = [UIColor blueColor];
//            [cell.snt_separatorView removeFromSuperview];
//            cell.snt_separatorView = nil;
        }
    }
    
    return cell;
}

#pragma optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[(NSUInteger)section].headerTile;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.sections[(NSUInteger)section].footerTitle;
}

@end
