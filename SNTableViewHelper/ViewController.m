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
    
    UIScreenEdgePanGestureRecognizer * pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(hanelPan:)];
    
    [[UIApplication sharedApplication].keyWindow addGestureRecognizer:pan];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewCell * cell = [ViewCell nibCellWithTabelView:tableView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)hanelPan:(UIScreenEdgePanGestureRecognizer *)sender {
    SNLog(@"-----");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SNLog(@"000000000000000000000000000");
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SNLog(@"``````````````````````````");
}

- (void)dealloc {
    SNLog(@"-----------dealloc-----------------");
}

@end
