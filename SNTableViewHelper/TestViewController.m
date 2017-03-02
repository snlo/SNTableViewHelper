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
    
    self.data = [@[
                   @{@"text":@"Following",@"value":@"45"},
                   @{@"text":@"Follower",@"value":@"10"},
                   @{@"text":@"Star",@"value":@"234"},
                   @{@"text":@"Setting",@"accessoryType":@(UITableViewCellAccessoryDisclosureIndicator)},
                   @{@"text":@"Share",@"accessoryType":@(UITableViewCellAccessoryDisclosureIndicator)},
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
        
        self.tableView.tableHeaderView = view;
        self.tableView.tableFooterView = view1;
        
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            section
            .nibCell([ViewCell class])
            .dataSection(self.data)
            .cellAutoHeight();
            [section configCell:^(ViewCell * cell, NSString * data, NSUInteger row) {
                cell.title_sn.text = @"Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.";
                if (row == 1) {
                    cell.title_sn.text = @"xxxx";
                }
            }]; @weakify(self);
            [section selected:^(NSUInteger row, id data) { @strongify(self);
                
                [self test];
            }];
            
        }];
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            
            section
            .nibCell([ViewCell class])
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
        
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            section
            .cell([TestViewCell class])
            .dataSection(self.feed)
            .cellAutoHeight();
            [section configCell:^(TestViewCell * cell, NSDictionary * data, NSUInteger row) {
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

@end
