//
//  UITableView+SNTableViewHelper.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <objc/runtime.h>
#import "UITableView+SNTableViewHelper.h"

#import "SNTableViewHelperManager.h"

@implementation UITableView (SNTableViewHelper)


- (SNTableViewDataSource *)snDataSource {
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setSnDataSource:(SNTableViewDataSource *)snDataSource {
    objc_setAssociatedObject(self,@selector(snDataSource),snDataSource,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SNTableViewDelegate *)snDelegate {
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setSnDelegate:(SNTableViewDelegate *)snDelegate {
    objc_setAssociatedObject(self,@selector(snDelegate),snDelegate,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


+ (instancetype)tabeleViewWithFrame:(CGRect)frame style:(UITableViewStyle)style superView:(UIView *)superView {
    
    UITableView * tableView = [[self alloc] initWithFrame:frame style:style];
    
    [superView addSubview:tableView];
    
    return tableView;
}

- (void)sn_helpTableView:(void(^)(SNTableViewHelper * helper))helper {
    SNTableViewHelper * viewHelper = [SNTableViewHelper helperWithTableView:self];

    SNTableViewDataSource * dataSource = [[SNTableViewDataSource alloc] init];
    SNTableViewDelegate * delegate = [[SNTableViewDelegate alloc] init];
    
    self.snDataSource = dataSource;
    self.snDelegate = delegate;
    
    self.dataSource = dataSource;
    self.delegate = delegate;
    
    dataSource.sections = viewHelper.sections;
    
    helper(viewHelper);
}

- (void)sn_helpDataSource:(void(^)(SNTableViewSectionHelper * helper))helper; {
    
}

@end
