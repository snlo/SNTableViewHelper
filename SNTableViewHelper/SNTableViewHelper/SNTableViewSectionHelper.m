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
- (SNTableViewSectionHelper * (^)(NSArray *))data {
    return ^SNTableViewSectionHelper *(NSArray * data) {
        self.sectionData.data = data;
        return self;
    };
}


#pragma mark -- getter

- (SNTableViewDataSourceSection *)sectionData {
    if (!_sectionData) {
        _sectionData = [SNTableViewDataSourceSection new];
    } return _sectionData;
}

@end
