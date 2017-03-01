//
//  TestViewController.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/3/1.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "TestViewController.h"

#import "ViewCell.h"

@interface TestViewController ()

@property (nonatomic, strong) NSArray * data;
@property (nonatomic, strong) UITableView * tableView;



@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor clearColor];
    
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, PHONE_WIDTH, 100);
    view.backgroundColor = [UIColor greenColor];
    
    UIView * view1 = [[UIView alloc]init];
    view1.frame = CGRectMake(0, 0, PHONE_WIDTH, 100);
    view1.backgroundColor = [UIColor blueColor];
    
    self.data = @[@"123",@"456",@"789"];
    
    
    self.tableView = [UITableView tabeleViewWithFrame:CGRectMake(0, 0, PHONE_WIDTH, PHONE_HEIGHT)
                                                style:UITableViewStyleGrouped
                                            superView:self.view];
//    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView sn_helpTableView:^(SNTableViewHelper *helper) {
        
        self.tableView.tableHeaderView = view;
        self.tableView.tableFooterView = view1;
        
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            section
            .cell([ViewCell class])
            .dataSection(self.data)
            .cellAutoHeight();
            [section configCell:^(ViewCell * cell, NSString * data, NSUInteger row) {
                cell.title_sn.text = @"Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.";
                SNLog(@"in cell --- %@",data);
            }]; @weakify(self);
            [section selected:^(NSUInteger row, id data) { @strongify(self);
                
                [self test];
            }];
            
        }];
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            
            section
            .cell([ViewCell class])
            .dataSection(@[@"11111",@"222222"])
            .cellHeight(44);
            [section configCell:^(ViewCell * cell, NSString * data, NSUInteger row) {
               cell.title_sn.text = data;
            }]; @weakify(self);
            [section selected:^(NSUInteger row, id data) { @strongify(self);
                SNLog(@"selected --- %@",data);
                switch (row) {
                    case 0: {
                        SNLog(@"first");
                        [self.navigationController popToRootViewControllerAnimated:YES];
                    } break;
                    case 1: {
                        SNLog(@"second");
                        [self.navigationController pushViewController:[TestViewController new] animated:YES];
                    } break;
                    default:
                        break;
                }
            }];
        }];
        
    }];
}

- (void)test {
    SNLog(@"xxxxxxx");
}

- (void)dealloc {
    SNLog(@"-----------dealloc-----------------");
}

@end
