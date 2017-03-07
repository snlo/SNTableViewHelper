//
//  ViewController.m
//  SNTableViewHelper
//
//  Created by sunDong on 2017/2/27.
//  Copyright © 2017年 snlo. All rights reserved.
//

#import "ViewController.h"

#import "ViewCell.h"

#import "TestViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = NSStringFromClass([self class]);
    
    
    self.tableView = [UITableView tabeleViewWithFrame:self.view.bounds style:UITableViewStyleGrouped superView:self.view];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.backgroundColor = [UIColor clearColor];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewCell * cell = [ViewCell nibCellWithTabelView:tableView];
    
    cell.title_sn.text = @"asdafd";
    
    if (indexPath.row == 0) {
        [cell.snt_separatorView removeFromSuperview];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
    
    ViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.title_sn.text = @"ok";
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)dealloc {
    SNLog(@"-----------dealloc-----------------");
}

@end
