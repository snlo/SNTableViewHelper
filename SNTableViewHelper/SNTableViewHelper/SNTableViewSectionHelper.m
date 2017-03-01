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
        self.sectionData.configcell = configCellBlock;
    }
}
- (void)selected:(SelectBlock)selectBlock {
    if (selectBlock) {
        self.sectionData.selected = selectBlock;
    }
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
