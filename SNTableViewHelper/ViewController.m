//
//  ViewController.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "ViewController.h"

#import "ViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) SNTableViewDataSource * dataSource_sn;
@property (nonatomic, strong) SNTableViewDelegate * delegate_sn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.alignmentRectInsets = UIEdgeInsetsMake(0, 0, 12, 0);
    
    self.tableView = [UITableView tabeleViewWithFrame:CGRectMake(0, 64, PHONE_WIDTH, PHONE_HEIGHT*0.5)
                                                style:UITableViewStyleGrouped
                                            superView:self.view];
    
    self.tableView.backgroundColor = [UIColor redColor];
    
    [self.tableView sn_helpTableView:^(SNTableViewHelper *helper) {
        
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            
            section.cell([ViewCell class])
            .data(@[@"",@""]);
        }];
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            
            section.cell([ViewCell class])
            .data(@[@"",@""]);
            [section helpCell:^(SNTableViewCellHelper *cell) {
                
            }];
        }];
        
    }];
    
}


@end
