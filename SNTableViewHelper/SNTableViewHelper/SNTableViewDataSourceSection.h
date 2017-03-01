//
//  SNTableViewDataSourceSection.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/28.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNTableViewDataSourceSection : NSObject

/**
 section dataSource
 */
@property (nonatomic, strong) NSArray * data;
@property (nonatomic, strong) Class cell;
@property (nonatomic, copy)

@end
