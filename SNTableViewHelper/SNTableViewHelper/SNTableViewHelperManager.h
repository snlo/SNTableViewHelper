//
//  SNTableViewHelperManager.h
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UITableViewCell+SNTableViewHelper.h"
#import "UITableView+SNTableViewHelper.h"

#import "SNTableViewProtocl.h"
#import "SNTableViewDataSource.h"
#import "SNTableViewDelegate.h"

#import "SNTableViewDataSourceSection.h"

#import "SNTableViewSectionHelper.h"
#import "SNTableViewCellHelper.h"
#import "SNTableViewHelper.h"

/////////////////////////////////////////////////////////////////////////////////////////////
#if TARGET_IPHONE_SIMULATOR
#define SNLog( s, ... ) NSLog( @"[%@:%d] %@", [[NSString stringWithUTF8String:__FILE__] \
lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define SNLog( s, ... )
#endif
/////////////////////////////////////////////////////////////////////////////////////////////
#define PHONE_WIDTH [UIScreen mainScreen].bounds.size.width   //手机宽
#define PHONE_HEIGHT [UIScreen mainScreen].bounds.size.height  //手机高

@interface SNTableViewHelperManager : NSObject

@end

