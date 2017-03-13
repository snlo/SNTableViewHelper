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
}

- (UIImageView *)snt_separatorView {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setSnt_separatorView:(UIImageView *)snt_separatorView {
    objc_setAssociatedObject(self, @selector(snt_separatorView), snt_separatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)snt_separatorInsetLeft {
    NSNumber * number = objc_getAssociatedObject(self, _cmd);
    return [number floatValue];
}
- (void)setSnt_separatorInsetLeft:(CGFloat)snt_separatorInsetLeft {
    NSNumber * number = [NSNumber numberWithFloat:snt_separatorInsetLeft];
    objc_setAssociatedObject(self, @selector(snt_separatorInsetLeft), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)snt_separatorInsetRight {
    NSNumber * number = objc_getAssociatedObject(self, _cmd);
    return [number floatValue];
}
- (void)setSnt_separatorInsetRight:(CGFloat)snt_separatorInsetRight {
    NSNumber * number = [NSNumber numberWithFloat:snt_separatorInsetRight];
    objc_setAssociatedObject(self, @selector(snt_separatorInsetRight), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)snt_separatorInset {
    NSValue * value = objc_getAssociatedObject(self, _cmd);
    return [value CGPointValue];
}
- (void)setSnt_separatorInset:(CGPoint)snt_separatorInset {
    NSValue * value = [NSNumber valueWithCGPoint:snt_separatorInset];
    
    objc_setAssociatedObject(self, @selector(snt_separatorInset), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.snt_separatorView.frame = CGRectMake(self.snt_separatorInset.x, 0, PHONE_WIDTH-self.snt_separatorInset.x - self.snt_separatorInset.y, 0.5);
}



+ (instancetype)nibCellWithTabelView:(UITableView *)tabelView indexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = NSStringFromClass([self class]);
    
    [tabelView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
    
    UITableViewCell * cell = [tabelView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell.is_snt_separator) {
        tabelView.separatorStyle = NO;
        if (!cell.snt_separatorView) {
            cell.snt_separatorView = [[UIImageView alloc] initWithImage:[UIImage snt_imageWithColor:[UIColor colorWithRed:0.783922 green:0.780392 blue:0.8 alpha:1]]];
            cell.snt_separatorView.frame = CGRectMake(cell.snt_separatorInsetLeft, 0, PHONE_WIDTH-cell.snt_separatorInsetLeft-cell.snt_separatorInsetRight, 0.5);
            [cell addSubview:cell.snt_separatorView];
        }
    }
    
    //    if (!cell) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
//    }
    
    return cell;
}

+ (instancetype)cellWithTabelView:(UITableView *)tabelView indexPath:(NSIndexPath *)indexPath {
    
    NSString * identifier = NSStringFromClass([self class]);
    
    [tabelView registerClass:self forCellReuseIdentifier:identifier];
    
    UITableViewCell * cell = [tabelView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell.is_snt_separator) {
        tabelView.separatorStyle = NO;
        if (!cell.snt_separatorView) {
            cell.snt_separatorView = [[UIImageView alloc] initWithImage:[UIImage snt_imageWithColor:[UIColor colorWithRed:0.783922 green:0.780392 blue:0.8 alpha:1]]];
            cell.snt_separatorView.frame = CGRectMake(cell.snt_separatorInsetLeft, 0, PHONE_WIDTH-cell.snt_separatorInsetLeft-cell.snt_separatorInsetRight, 0.5);
            [cell addSubview:cell.snt_separatorView];
        }
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


@implementation UIImage (SNTableViewHelper)

+ (UIImage *)snt_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return image;
}

@end

