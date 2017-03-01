//
//  SNTableViewSectionHelper.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNTableViewDataSourceSection;

@interface SNTableViewSectionHelper : NSObject

@property (nonatomic, strong) SNTableViewDataSourceSection *sectionData;

- (SNTableViewSectionHelper * (^)(Class))cell;

//section的数据源
- (SNTableViewSectionHelper * (^)(NSArray *))dataSection;

//cell自适应高度
- (SNTableViewSectionHelper * (^)(void))cellAutoHeight;

//配置cell静态高度
- (SNTableViewSectionHelper * (^)(CGFloat))cellHeight;

//配置cell的回调
- (void)configCell:(ConfigCellBlock)configCellBlock;

//处理事件的回调
- (void)selected:(SelectBlock)selectBlock;



@end
