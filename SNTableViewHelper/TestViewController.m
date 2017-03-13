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
#import "Masonry.h"

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
    
    UIView * testView = [[UIView alloc] init];
    testView.backgroundColor = [UIColor redColor];
    testView.frame = CGRectMake(15, 0, PHONE_WIDTH, 100);
    
    
    self.data = [@[@[
                       @{@"text":@"Following",@"value":@"45"},
                       @{@"text":@"Follower",@"value":@"10"},
                       @{@"text":@"Star",@"value":@"234"},
                       @{@"text":@"Setting",@"accessoryType":@(UITableViewCellAccessoryDisclosureIndicator)},
                       @{@"text":@"Share",@"accessoryType":@(UITableViewCellAccessoryDisclosureIndicator)},
                       @"xxxxxxxxxx",
                       ],
                   @{@"text":@"dddd"},
                   @{@"text":@"nnnn"},
                   
                   @[
                       @{@"text":@"FollowingFollowingFollowingFollowingFollowingFollowingFollowingFollowingFollowingFollowingFollowingFollowing",@"value":@"45"},
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
    
    
    self.tableView = [UITableView tabeleViewWithFrame:CGRectMake(0, 0, PHONE_WIDTH, PHONE_HEIGHT)
                                                style:UITableViewStyleGrouped
                                            superView:self.view];


    [self.tableView sn_helpTableView:^(SNTableViewHelper *helper) {
        
        self.tableView.tableHeaderView = self.tableHeaderView;
        self.tableView.tableFooterView = self.tableFooterView;
        
        
        [helper helpSpecialSection:^(SNTableViewSectionHelper *section) {
            section
            .nibCell([ViewCell class])
            .dataSection(self.data)
            .cellAutoHeight();
            [section headerView:self.sectionHeaderView setting:^(UIView *headerView, NSUInteger section) {
                
                if (section == 1) {
                    headerView.backgroundColor = [UIColor redColor];
                }
            }];
            [section configCell:^(ViewCell * cell, id data, NSIndexPath * indexPath, UITableView * tableView) {

                NSString * string = [[NSString alloc] init];
                if ([data isKindOfClass:[NSDictionary class]]) {
                    string = data[@"text"];
                } else {
                    string = data;
                }
                cell.title_sn.text = string;
                
                
                
                
            }]; @weakify(self);
            [section selected:^(NSUInteger row, id data, UITableView * tableView) { @strongify(self);
                
                [self test];
            }];
            
        }];
        [helper helpSection:^(SNTableViewSectionHelper *section) {
            
            section
            .nibCell([ViewCell class])
            .dataSection(@[@"11111",@"222222",@"11111",@"222222",@"11111",@"222222"])
            .cellHeight(44);
            [section headerView:self.sectionHeaderView setting:^(UIView *headerView, NSUInteger section) {
               
            }];
            [section configCell:^(ViewCell * cell, NSString * data, NSIndexPath * indexPath, UITableView * tableView) {
               cell.title_sn.text = data;
                if (indexPath.row == 1) {
                } else {
                    cell.title_sn.text = @"xxxxxxxxxxxxx";
                }
            }]; @weakify(self);
            [section selected:^(NSUInteger row, id data, UITableView * tableView) { @strongify(self);
                
                switch (row) {
                    case 0: {
                        
                        [self.navigationController popToRootViewControllerAnimated:YES];
                    } break;
                    case 1: {

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
            .footerTitle(@"footer title");
            [section headerView:self.sectionHeaderView setting:^(UIView *headerView, NSUInteger section) {
                
            }];
            [section configCell:^(TestViewCell * cell, NSDictionary * data, NSIndexPath * indexPath, UITableView * tableView) {
                [cell.avatarView setImage:[UIImage imageNamed:data[@"avatar"]]];
                [cell.nameView setText:data[@"user"]];
                [cell.dateView setText:data[@"date"]];
                [cell.detailView setText:data[@"content"]];
                [cell.imgView setImage:[UIImage imageNamed:data[@"image"]]];
                
            }];
            [section selected:^(NSUInteger row, id data, UITableView * tableView) {
                
            }];
        }];
        
    }];
    @weakify(self);
    [self.tableView didScroll:^(UIScrollView *scrollView) { @strongify(self);
        
        [self test];
        
    }];
    
    [self.tableView didEndDragging:^(UIScrollView *scrollerView, BOOL decelerate) { 
        
        [self test];
        
    }];
    

    [self.tableView configRowActions:^NSArray<UITableViewRowAction *> *(UITableView *tableView, NSIndexPath *indexPath, RowActionHandler handler) {
        
        //test
        
        UIButton *buttonForImage = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault image:[buttonForImage imageForState:UIControlStateNormal] handler:handler];
        
        UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"disenable" handler:handler];
        action2.enabled = false;
        
        UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"emjoy👍" handler:handler];
        
        return @[action1,action2,action3];
        
    } handler:^(UITableView * tableView, UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        SNLog(@"%@",action.title);
        
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
    if (!_sectionHeaderView) {
        _sectionHeaderView = [[UIView alloc] init];
        _sectionHeaderView.frame = CGRectMake(0, 0, PHONE_WIDTH, 30);
        _sectionHeaderView.backgroundColor = [UIColor clearColor];
    }
    
    return _sectionHeaderView;
}
- (UIView *)sectionFooterView {
    _sectionFooterView = [[UIView alloc] init];
    _sectionFooterView.frame = CGRectMake(0, 0, PHONE_WIDTH, 10);
    _sectionFooterView.backgroundColor = [UIColor yellowColor];
    return _sectionFooterView;
}

@end
