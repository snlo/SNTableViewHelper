//
//  UITableViewCell+SNTableViewHelper.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "UITableViewCell+SNTableViewHelper.h"

#import "SNTableViewHelperManager.h"

@implementation UITableViewCell (SNTableViewHelper)

+ (instancetype)nibCellWithTabelView:(UITableView *)tabelView
{
    NSString * identifier = NSStringFromClass([self class]);
    UITableViewCell * cell = [tabelView dequeueReusableCellWithIdentifier:identifier];
    
    UINib * nib = [UINib nibWithNibName:identifier bundle:nil];
    [tabelView registerNib:nib forCellReuseIdentifier:identifier];
    cell = [tabelView dequeueReusableCellWithIdentifier:identifier];

//    if (!cell) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
//    }
    
    return cell;
}

+ (instancetype)cellWithTabelView:(UITableView *)tabelView {
    
    NSString * identifier = NSStringFromClass([self class]);
    
    UITableViewCell * cell = [tabelView dequeueReusableCellWithIdentifier:identifier];
    
    return cell;
}

@end
