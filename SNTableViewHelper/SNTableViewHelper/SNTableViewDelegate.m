//
//  SNTableViewDelegate.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "SNTableViewDelegate.h"

#import "SNTableViewHelperManager.h"

@implementation SNTableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SNLog(@"selected cell");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
