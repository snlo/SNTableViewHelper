//
//  TestViewController.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/3/1.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "TestViewController.h"

#import "ViewCell.h"

#import "TestViewCell.h"

@interface TestViewController ()

@property (nonatomic, strong) NSMutableArray * data;
@property (nonatomic, strong) NSMutableArray * feed;

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIView * tableHeaderView;
@property (nonatomic, strong) UIView * tableFooterView;
@property (nonatomic, strong) UIView * sectionHeaderView;
@property (nonatomic, strong) UIView * sectionFooterView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor clearColor];
    
    
    self.data = [@[@[
                       @{@"text":@"Following",@"value":@"45"},
                       @{@"text":@"Follower",@"value":@"10"},
                       @{@"text":@"Star",@"value":@"234"},
                       @{@"text":@"Setting",@"accessoryType":@(UITableViewCellAccessoryDisclosureIndicator)},
                       @{@"text":@"Share",@"accessoryType":@(UITableViewCellAccessoryDisclosureIndicator)},
                       ],
                   @[
                       @{@"text":@"Following",@"value":@"45"},
                       @{@"text":@"Follower",@"value":@"10"},
                       @{@"text":@"Star",@"value":@"234"},
                       @{@"text":@"Setting",@"accessoryType":@(UITableViewCellAccessoryDisclosureIndicator)},
                       @{@"text":@"Share",@"accessoryType":@(UITableViewCellAccessoryDisclosureIndicator)},
                       ]
                   ] mutableCopy];
    self.feed = [NSMutableArray new];
    NSError*error;
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"feed"ofType:@"json"];
    NSData *json = [[NSData alloc]initWithContentsOfFile:filePath];
    NSArray * jsonObject = [NSJSONSerialization JSONObjectWithData:json options:(NSJSONReadingOptions) kNilOptions error:&error];
    [self.feed addObjectsFromArray:jsonObject];
    
//    SNLog(@"%@",self.feed);
    
    self.tableView = [UITableView tabeleViewWithFrame:CGRectMake(0, 0, PHONE_WIDTH, PHONE_HEIGHT)
                                                style:UITableViewStyleGrouped
                                            superView:self.view];
//    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView sn_helpTableView:^(SNTableViewHelper *helper) {
        
        self.tableView.tableHeaderView = self.tableHeaderView;
        self.tableView.tableFooterView = self.tableFooterView;
        
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            section
            .nibCell([ViewCell class])
            .dataSection(self.data)
            .cellAutoHeight()
            .headerView(self.sectionHeaderView, ^(){
                
            });
            [section configCell:^(ViewCell * cell, id data, NSIndexPath * indexPath) {
//                cell.title_sn.text = data[@"text"];
                NSString * string = [[NSString alloc] init];
                if ([data isKindOfClass:[NSDictionary class]]) {
                    string = data[@"text"];
                } else {
                    string = data;
                }
                cell.title_sn.text = string;
            }]; @weakify(self);
            [section selected:^(NSUInteger row, id data) { @strongify(self);
                
                [self test];
            }];
            
        }];
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            
            section
            .nibCell([ViewCell class])
            .dataSection(@[@"11111",@"222222"])
            .cellHeight(44)
            .headerView(self.sectionHeaderView, ^() {
                self.sectionHeaderView.backgroundColor = [UIColor redColor];
            });
            [section configCell:^(ViewCell * cell, NSString * data, NSIndexPath * indexPath) {
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
        
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            section
            .cell([TestViewCell class])
            .dataSection(self.feed)
            .cellAutoHeight()
            .headerView(self.sectionHeaderView, ^() {
                self.sectionHeaderView.backgroundColor = [UIColor redColor];
            });
            [section configCell:^(TestViewCell * cell, NSDictionary * data, NSIndexPath * indexPath) {
                [cell.avatarView setImage:[UIImage imageNamed:data[@"avatar"]]];
                [cell.nameView setText:data[@"user"]];
                [cell.dateView setText:data[@"date"]];
                [cell.detailView setText:data[@"content"]];
                [cell.imgView setImage:[UIImage imageNamed:data[@"image"]]];
            }];
            [section selected:^(NSUInteger row, id data) {
                SNLog(@"非nib创建的cell");
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

- (UIView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc]init];
        _tableHeaderView.frame = CGRectMake(0, 0, PHONE_WIDTH, 100);
        _tableHeaderView.backgroundColor = [UIColor greenColor];
    } return _tableHeaderView;
}
- (UIView *)tableFooterView {
    if (!_tableFooterView) {
        _tableFooterView = [[UIView alloc]init];
        _tableFooterView.frame = CGRectMake(0, 0, PHONE_WIDTH, 100);
        _tableFooterView.backgroundColor = [UIColor greenColor];
    } return _tableFooterView;
}

- (UIView *)sectionHeaderView {
    _sectionHeaderView = [[UIView alloc] init];
    _sectionHeaderView.frame = CGRectMake(0, 0, PHONE_WIDTH, 10);
    _sectionHeaderView.backgroundColor = [UIColor blueColor];
    return _sectionHeaderView;
}
- (UIView *)sectionFooterView {
    _sectionFooterView = [[UIView alloc] init];
    _sectionFooterView.frame = CGRectMake(0, 0, PHONE_WIDTH, 10);
    _sectionFooterView.backgroundColor = [UIColor blueColor];
    return _sectionFooterView;
}

@end
