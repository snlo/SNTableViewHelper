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
    SNTableViewSectionHelper * sectionHelper = [[SNTableViewSectionHelper alloc] init];
    sectionBlock(sectionHelper);
    
    if (sectionHelper.sectionData.cell) {
        [self.tableView registerClass:sectionHelper.sectionData.cell forCellReuseIdentifier:sectionHelper.sectionData.identifier];
    }
    [self.sections addObject:sectionHelper.sectionData];
}

- (void)helpSpecialSection:(void(^)(SNTableViewSectionHelper * section))sectionBlock {
    SNTableViewSectionHelper * sectionHelper = [[SNTableViewSectionHelper alloc] init];
    sectionBlock(sectionHelper);
    
    __block NSMutableArray * dicArray = [[NSMutableArray alloc] init];
    __block NSMutableArray * tempArray = [[NSMutableArray alloc]init];
    
    [sectionHelper.sectionData.dataSection enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SNTableViewSectionHelper * helper = [[SNTableViewSectionHelper alloc] init];
        sectionBlock(helper);
        
        if (helper.sectionData.cell) {
            [self.tableView registerClass:helper.sectionData.cell forCellReuseIdentifier:helper.sectionData.identifier];
        }
        
        if ([obj isKindOfClass:[NSArray class]]) {
            
            helper.sectionData.dataSection = obj;
            [self.sections addObject:helper.sectionData];
            
        } else if ([obj isKindOfClass:[NSDictionary class]]) {

            [dicArray addObject:obj];
        }
        else {
            SNLog(@"Warning:data source error -> %@, should be array array or dicionary",obj);
            [tempArray addObject:obj];
        }
    }];
    if (dicArray.count > 0) {
        sectionHelper.sectionData.dataSection = dicArray;
        [self.sections addObject:sectionHelper.sectionData];
    }
    if (tempArray.count > 0) {
        sectionHelper.sectionData.dataSection = tempArray;
        [self.sections addObject:sectionHelper.sectionData];
    }
}

- (void)helpSomeSection:(void(^)(SNTableViewSectionHelper * section))sectionBlock {
    SNTableViewSectionHelper * tempSectionHelper = [[SNTableViewSectionHelper alloc] init];
    sectionBlock(tempSectionHelper);
    
    [tempSectionHelper.sectionData.dataSection enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            SNTableViewSectionHelper * sectionHelper = [[SNTableViewSectionHelper alloc] init];
            sectionBlock(sectionHelper);
            sectionHelper.sectionData.dataSection = obj;
            
            if (sectionHelper.sectionData.cell) {
                [self.tableView registerClass:sectionHelper.sectionData.cell forCellReuseIdentifier:sectionHelper.sectionData.identifier];
            }
            
            [self.sections addObject:sectionHelper.sectionData];
        } else {
            SNLog(@"Warning:data source error -> %@, should be array array",obj);
        }
    }];
}


#pragma mark -- getter

- (NSMutableArray *)sections {
    if (!_sections) {
        _sections = [[NSMutableArray alloc] init];
    }
    return _sections;
}

@end
