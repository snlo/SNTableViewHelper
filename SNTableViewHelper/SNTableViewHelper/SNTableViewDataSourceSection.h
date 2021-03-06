//
//  SNTableViewDataSourceSection.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/28.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

__attribute__((objc_subclassing_restricted)) //标记不能被继承

@interface SNTableViewDataSourceSection : NSObject

/*
 section dataSource
*/
@property (nonatomic, strong) NSArray * dataSection;

@property (nonatomic, strong) Class cell;
@property (nonatomic, strong) Class nibCell;
@property (nonatomic, assign) BOOL isNibCell;

@property(nonatomic, strong) NSString * identifier;
@property (nonatomic, copy) ConfigCellBlock configCell;
@property (nonatomic, assign) BOOL isAutoCellHeight;
@property (nonatomic, assign) CGFloat cellHeight;


@property (nonatomic, strong) NSString * headerTile;
@property (nonatomic, strong) NSString * footerTitle;
@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) UIView * footerView;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, copy) SelectBlock selected;

@property (nonatomic, copy) HeaderviewBlock headerViewBlock;
@property (nonatomic, copy) FooterViewBlock footerViewBlock;

@end
