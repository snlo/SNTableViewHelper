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

- (NSMutableDictionary * )delegates {
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setDelegates:(NSMutableDictionary *)delegates {
    objc_setAssociatedObject(self,@selector(delegates),delegates,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark -- UITableViewDataSource

#pragma required method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].dataSection.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [UITableViewCell new];
    if (self.sections[indexPath.section].isNibCell) {
        cell = [self.sections[indexPath.section].cell nibCellWithTabelView:tableView indexPath:indexPath];
    } else {
        cell = [self.sections[indexPath.section].cell cellWithTabelView:tableView indexPath:indexPath];
    }
    
    ConfigCellBlock configCellBlock = self.sections[indexPath.section].configCell;
    
    id data = self.sections[indexPath.section].dataSection[indexPath.row];
    
    if (configCellBlock) {
        configCellBlock(cell, data, indexPath, tableView);
    }
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        if (cell.is_snt_separator) {
            [cell.snt_separatorView removeFromSuperview];
            cell.snt_separatorView = nil;
        }
    }
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

#pragma mark -- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SelectBlock selectBlock = self.sections[indexPath.section].selected;
    
    if (selectBlock) {
        id data = self.sections[indexPath.section].dataSection[indexPath.row];
        selectBlock(indexPath.row, data, tableView);
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0) {
    return 44;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0) {
//    return 40;
//}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0) {
//    return 40;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sections[indexPath.section].cellHeight) {
        return self.sections[indexPath.section].cellHeight;
    } else if (self.sections[indexPath.section].isAutoCellHeight) {
        NSUInteger section = (NSUInteger) indexPath.section;
        NSUInteger index = (NSUInteger) indexPath.row;
        NSString * identifier = self.sections[section].identifier;
        
        ConfigCellBlock configCellBlock = self.sections[section].configCell;
        id data = self.sections[section].dataSection[index];
        
        NSNumber * numHeight = objc_getAssociatedObject(data, NSSelectorFromString(identifier));
        
        if(!numHeight) {
            UITableViewCell * cell = [self cellForReuseIdentifier:identifier withTableView:tableView];
            [cell prepareForReuse];
            
            if(configCellBlock) {
                configCellBlock(cell,data,indexPath, tableView);
            }
            CGFloat height = [self systemFittingHeightForConfiguratedCell:cell withTalbView:tableView];
            objc_setAssociatedObject(data,NSSelectorFromString(identifier),@(height),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            return height;
        } else {
            return [numHeight floatValue];
        }
    } else {
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.sections[(NSUInteger)section].headerView) {
        return self.sections[(NSUInteger)section].headerView.frame.size.height;
    } else if (self.sections[(NSUInteger)section].headerTile) {
        return 40;
    } else if (self.sections[(NSUInteger)section].headerHeight) {
        return self.sections[(NSUInteger)section].headerHeight;
    } else {
        return 0.001;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.sections[(NSUInteger)section].footerView) {
        return self.sections[(NSUInteger)section].footerView.frame.size.height;
    } else if (self.sections[(NSUInteger)section].footerTitle) {
        return 40;
    } else  if (self.sections[(NSUInteger)section].footerHeight) {
        return self.sections[(NSUInteger)section].footerHeight;
    } else {
        return 0.001;
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeaderviewBlock headerViewBlock = self.sections[section].headerViewBlock;
    if (headerViewBlock) {
        headerViewBlock(self.sections[(NSUInteger)section].headerView, (NSUInteger)section);
    }
    return self.sections[(NSUInteger)section].headerView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    FooterViewBlock footerViewBlock = self.sections[section].footerViewBlock;
    if (footerViewBlock) {
        footerViewBlock(self.sections[(NSUInteger)section].footerView, (NSUInteger)section);
    }
    return self.sections[(NSUInteger)section].footerView;
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0) {
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.configRowActionsBlock) {
        [tableView setEditing:false animated:true];
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.configRowActionsBlock) {
        return YES;
    } else {
        return NO;
    }
}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    void(^rowActionHandler)(UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        if (self.handleRowActionHandler) {
            self.handleRowActionHandler(tableView, action, indexPath);
        }
        [tableView setEditing:false animated:true];
    };
    
    if (self.configRowActionsBlock) {
        return self.configRowActionsBlock(tableView, indexPath, rowActionHandler);
    } else {
        return @[];
    }
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.didscrollBlock) {
        self.didscrollBlock(scrollView);
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.didEndDraggingBlock) {
        self.didEndDraggingBlock(scrollView, decelerate);
    }
}

#pragma mark -- pravite method

- (__kindof UITableViewCell *)cellForReuseIdentifier:(NSString *)identifier withTableView:(UITableView*)tableView{
    NSAssert(identifier.length > 0, @"Expect a valid identifier - %@", identifier);
    
    NSMutableDictionary<NSString *, UITableViewCell *> *templateCellsByIdentifiers = objc_getAssociatedObject(self, _cmd);
    if (!templateCellsByIdentifiers) {
        templateCellsByIdentifiers = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, templateCellsByIdentifiers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    UITableViewCell *templateCell = templateCellsByIdentifiers[identifier];
    
    if (!templateCell) {
        templateCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        NSAssert(templateCell != nil, @"Cell must be registered to table view for identifier - %@", identifier);
        templateCell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        templateCellsByIdentifiers[identifier] = templateCell;
    }
    
    return templateCell;
}

- (CGFloat)systemFittingHeightForConfiguratedCell:(UITableViewCell *)cell withTalbView:(UITableView*)tableView {
    
    CGFloat contentViewWidth = CGRectGetWidth(tableView.frame);
    
    if (cell.accessoryView) {
        contentViewWidth -= 16 + CGRectGetWidth(cell.accessoryView.frame);
    } else {
        static const CGFloat systemAccessoryWidths[5] = {
            [UITableViewCellAccessoryNone] = 0,
            [UITableViewCellAccessoryDisclosureIndicator] = 34,
            [UITableViewCellAccessoryDetailDisclosureButton] = 68,
            [UITableViewCellAccessoryCheckmark] = 40,
            [UITableViewCellAccessoryDetailButton] = 48
        };
        contentViewWidth -= systemAccessoryWidths[cell.accessoryType];
    }
    
    CGFloat fittingHeight = 0;
    
    if (contentViewWidth > 0) {
        NSLayoutConstraint *widthFenceConstraint =
        [NSLayoutConstraint
         constraintWithItem:cell.contentView
         attribute:NSLayoutAttributeWidth
         relatedBy:NSLayoutRelationEqual
         toItem:nil
         attribute:NSLayoutAttributeNotAnAttribute
         multiplier:1.0
         constant:contentViewWidth];
        [cell.contentView addConstraint:widthFenceConstraint];
        
        fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        [cell.contentView removeConstraint:widthFenceConstraint];
    }
    
    if (fittingHeight == 0) {
#if DEBUG
        if (cell.contentView.constraints.count > 0) {
            if (!objc_getAssociatedObject(self, _cmd)) {
                SNLog(@"Warning: Cannot get a proper cell height (now 0) from '- systemFittingSize:'(AutoLayout). You should check how constraints are built in cell, making it into 'self-sizing' cell.");
                objc_setAssociatedObject(self, _cmd, @YES, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
        }
#endif
    }
    
    if (fittingHeight == 0) {
        fittingHeight = 44;
    }
    
    if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        fittingHeight += 1.0 / [UIScreen mainScreen].scale;
    }
    
    return fittingHeight;
}

@end
