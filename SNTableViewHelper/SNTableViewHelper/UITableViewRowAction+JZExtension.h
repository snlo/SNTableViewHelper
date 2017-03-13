//
//  UITableViewRowAction+JZExtension.h
//  MIX
//
//  Created by Jazys on 10/23/15.
//  Copyright © 2015 Jazys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewRowAction (JZExtension)

@property (nonatomic, strong, nullable) UIImage *image;

/**
 是否可点击
 */
@property (nonatomic, assign) BOOL enabled;

+ (nonnull instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style image:(nullable UIImage *)image handler:(nullable void (^)(UITableViewRowAction * _Nullable action, NSIndexPath * _Nullable indexPath))handler;

@end
