//
//  ViewCell.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "ViewCell.h"

@implementation ViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.title_sn.numberOfLines = 0;
    
    self.is_snt_separator = YES;
    self.snt_separatorX = 20;
    self.snt_separatorWidth = PHONE_WIDTH / 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
