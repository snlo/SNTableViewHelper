//
//  SNTableViewSectionHelper.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNTableViewCellHelper;

@interface SNTableViewSectionHelper : NSObject

@property (nonatomic, strong) SNTableViewDataSourceSection *sectionData;

- (SNTableViewSectionHelper * (^)(Class))cell;
- (SNTableViewSectionHelper * (^)(NSArray *))data;

@end
