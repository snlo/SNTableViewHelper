//
//  UITableViewCell+SNTableViewHelper.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <objc/runtime.h>
#import "UITableViewCell+SNTableViewHelper.h"

#import "SNTableViewHelperManager.h"

@implementation UITableViewCell (SNTableViewHelper)

- (BOOL)is_snt_separator {
    NSNumber * number = objc_getAssociatedObject(self, _cmd);
    return [number boolValue];
}
- (void)setIs_snt_separator:(BOOL)is_snt_separator {
    NSNumber * number = [NSNumber numberWithBool:is_snt_separator];
    objc_setAssociatedObject(self, @selector(is_snt_separator), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (is_snt_separator) {
        self.snt_separatorView = [[UIView alloc]init];
        self.snt_separatorView.frame = CGRectMake(15, 0, PHONE_WIDTH-15, 0.5);
        self.snt_separatorView.backgroundColor = [UIColor redColor];
        [self addSubview:self.snt_separatorView];
    }
}

- (UIView *)snt_separatorView {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setSnt_separatorView:(UIView *)snt_separatorView {
    objc_setAssociatedObject(self, @selector(snt_separatorView), snt_separatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)snt_separatorX {
    NSNumber * number = objc_getAssociatedObject(self, _cmd);
    return [number floatValue];
}
- (void)setSnt_separatorX:(CGFloat)snt_separatorX {
    NSNumber * number = [NSNumber numberWithFloat:snt_separatorX];
    objc_setAssociatedObject(self, @selector(snt_separatorX), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (snt_separatorX) {
        self.snt_separatorView.frame = CGRectMake(snt_separatorX, 0, CGRectGetWidth(self.snt_separatorView.frame), 0.5);
    }
}

- (CGFloat)snt_separatorWidth {
    NSNumber * number = objc_getAssociatedObject(self, _cmd);
    return [number floatValue];
}
- (void)setSnt_separatorWidth:(CGFloat)snt_separatorWidth {
    NSNumber * number = [NSNumber numberWithFloat:snt_separatorWidth];
    objc_setAssociatedObject(self, @selector(snt_separatorWidth), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (snt_separatorWidth) {
        self.snt_separatorView.frame = CGRectMake(self.snt_separatorView.frame.origin.x, 0, snt_separatorWidth, 0.5);
    }
}



+ (instancetype)nibCellWithTabelView:(UITableView *)tabelView
{
    NSString * identifier = NSStringFromClass([self class]);
    
    [tabelView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
    
    UITableViewCell * cell = [tabelView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell.is_snt_separator) {
        tabelView.separatorStyle = NO;
    }
    
//    if (!cell) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
//    }
    
    return cell;
}

+ (instancetype)cellWithTabelView:(UITableView *)tabelView {
    
    NSString * identifier = NSStringFromClass([self class]);
    
    [tabelView registerClass:self forCellReuseIdentifier:identifier];
    
    UITableViewCell * cell = [tabelView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell.is_snt_separator) {
        tabelView.separatorStyle = NO;
    }
    
//    if (!cell) {
//        cell = [[[self class] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
    
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}




@end
