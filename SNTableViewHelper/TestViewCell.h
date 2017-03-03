//
//  TestViewCell.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/3/2.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewCell : UITableViewCell

@property(nonatomic, retain) UIImageView * avatarView;
@property(nonatomic, strong) UIView * userView;
@property(nonatomic, retain) UILabel * nameView;
@property(nonatomic, retain) UILabel * dateView;
@property(nonatomic, retain) UILabel * detailView;
@property(nonatomic, retain) UIImageView * imgView;
- (void)testView:(UIView*(^)())block;
@end
