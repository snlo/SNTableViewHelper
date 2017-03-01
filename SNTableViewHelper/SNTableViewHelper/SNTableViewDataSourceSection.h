//
//  SNTableViewDataSourceSection.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/28.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNTableViewDataSourceSection : NSObject

/*
 section dataSource
*/
@property (nonatomic, strong) NSArray * dataSection;
@property (nonatomic, strong) Class cell;
@property (nonatomic, copy) ConfigCellBlock configcell;
@property (nonatomic, assign) BOOL isAutoCellHeight;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, copy) SelectBlock selected;

@end
