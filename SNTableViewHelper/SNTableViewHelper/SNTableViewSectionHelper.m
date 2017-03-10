//
//  SNTableViewSectionHelper.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "SNTableViewSectionHelper.h"

#import "SNTableViewHelperManager.h"

@implementation SNTableViewSectionHelper

- (SNTableViewSectionHelper *(^)(__unsafe_unretained Class))cell {
    return ^SNTableViewSectionHelper *(Class cell) {
        self.sectionData.cell = cell;
        if (!cell) {
            self.sectionData.cell = [UITableViewCell class];
        }
        if (!self.sectionData.identifier) {
            self.sectionData.identifier = NSStringFromClass([self.sectionData.cell class]);
        }
        return self;
    };
}
- (SNTableViewSectionHelper *(^)(__unsafe_unretained Class))nibCell {
    return ^SNTableViewSectionHelper *(Class nibCell) {
        self.sectionData.cell = nibCell;
        self.sectionData.isNibCell = YES;
        if (!self.sectionData.identifier) {
            self.sectionData.identifier = NSStringFromClass([nibCell class]);
        }
        return self;
    };
}

- (SNTableViewSectionHelper * (^)(NSArray *))dataSection {
    return ^SNTableViewSectionHelper *(NSArray * dataSection) {
        
        self.sectionData.dataSection = dataSection;
        return self;
    };
}
- (SNTableViewSectionHelper *(^)(void))cellAutoHeight {
    return ^SNTableViewSectionHelper *(void) {
        self.sectionData.isAutoCellHeight = YES;
        return self;
    };
}
- (SNTableViewSectionHelper *(^)(CGFloat))cellHeight {
    return ^SNTableViewSectionHelper *(CGFloat cellHeight) {
        self.sectionData.cellHeight = cellHeight;
        return self;
    };
}
- (void)configCell:(ConfigCellBlock)configCellBlock {
    if (configCellBlock) {
        self.sectionData.configCell = configCellBlock;
    }
}
- (void)selected:(SelectBlock)selectBlock {
    if (selectBlock) {
        self.sectionData.selected = selectBlock;
    }
}

- (SNTableViewSectionHelper *(^)(NSString *))headerTitle {
    return ^SNTableViewSectionHelper *(NSString *headerTitle) {
        self.sectionData.headerTile = headerTitle;
        return self;
    };
}
- (SNTableViewSectionHelper *(^)(NSString *))footerTitle {
    return ^SNTableViewSectionHelper *(NSString *footerTitle) {
        self.sectionData.footerTitle = footerTitle;
        return self;
    };
}
- (SNTableViewSectionHelper *(^)(UIView *(^)()))headerView {
    return ^SNTableViewSectionHelper *(UIView *(^view)()) {
        self.sectionData.headerView = view();
        return self;
    };
}
- (void)headerView:(UIView *)headerView setting:(HeaderviewBlock)headerViewBlock {
    self.sectionData.headerView = [UIView snt_copyView:headerView];
    if (headerViewBlock) {
        self.sectionData.headerViewBlock = headerViewBlock;
    }
}

- (SNTableViewSectionHelper *(^)(UIView *(^)()))footerView {
    return ^SNTableViewSectionHelper *(UIView * (^view)()) {
        self.sectionData.footerView = view();
        return self;
    };
}
- (void)footerView:(UIView *)footerView setting:(FooterViewBlock)footerViewBlock {
    self.sectionData.footerView = [UIView snt_copyView:footerView];
    if (footerViewBlock) {
        self.sectionData.footerViewBlock = footerViewBlock;
    }
}

- (SNTableViewSectionHelper * (^)(CGFloat headerHeight))headerHeight {
    return ^SNTableViewSectionHelper *(CGFloat headerHeight) {
        self.sectionData.headerHeight = headerHeight;
        return self;
    };
}
- (SNTableViewSectionHelper * (^)(CGFloat footerHeight))footerHeight {
    return ^SNTableViewSectionHelper *(CGFloat footerHeight) {
        self.sectionData.footerHeight = footerHeight;
        return self;
    };
}

#pragma mark -- getter

- (SNTableViewDataSourceSection *)sectionData {
    if (!_sectionData) {
        _sectionData = [SNTableViewDataSourceSection new];
    } return _sectionData;
}

- (NSString *)getIdentifier {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStrRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString * retStr = (__bridge NSString *) uuidStrRef;
    CFRelease(uuidStrRef);
    return retStr;
}

@end

#pragma other category

@implementation UIView (SNTableViewHelper)

+ (UIView *)snt_copyView:(UIView *)view {
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

@end
