//
//  SNTableViewSectionHelper.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef UIView *(^SNHeaderFooterView)();

@class SNTableViewDataSourceSection;

@interface SNTableViewSectionHelper : NSObject

@property (nonatomic, strong) SNTableViewDataSourceSection *sectionData;

//当为null时，默认为‘UITableviewCell’
- (SNTableViewSectionHelper * (^)(Class))cell;

- (SNTableViewSectionHelper * (^)(Class))nibCell;

//section的数据源
- (SNTableViewSectionHelper * (^)(NSArray *))dataSection;

//cell自适应高度。当cell上布局约束不健全时会抛出警告，并失效默认为44。
- (SNTableViewSectionHelper * (^)(void))cellAutoHeight;

//配置cell静态高度
- (SNTableViewSectionHelper * (^)(CGFloat))cellHeight;

//配置cell的回调
- (void)configCell:(ConfigCellBlock)configCellBlock;

//处理事件的回调
- (void)selected:(SelectBlock)selectBlock;

- (SNTableViewSectionHelper * (^)(NSString *))headerTitle;
- (SNTableViewSectionHelper * (^)(NSString *))footerTitle;

- (SNTableViewSectionHelper * (^)(UIView *,void(^)()))headerView;
- (SNTableViewSectionHelper * (^)(UIView * (^)()))footerView;



@end
