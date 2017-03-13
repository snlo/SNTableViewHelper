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
{
    NSMutableArray <NSDictionary *> * _dataSource;
}

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
    ViewCell * cell = [ViewCell nibCellWithTabelView:tableView indexPath:indexPath];
    
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
    
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithArray:@[@"1",@"2"]];
    }
    SNLog(@"array -- - - %@",_dataSource);
    
    [self testCopyObject:&_dataSource];
    
    SNLog(@"copyed array -- - - %@",_dataSource);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

}



/**
 实例变量的地址传递：’NSMutableArray **‘ 是 'NSMutableArray * __autoreleasing*‘的缩写，而ARC需要知道对象应用计数的所有权，所以应该写成'NSMutableArray * __strong*'。
 */
- (void)testCopyObject:(NSMutableArray * __strong*)array {
    
    [* array addObject:@"3"];
}

- (void)dealloc {
    SNLog(@"-----------dealloc-----------------");
}

@end
