//
//  MyTableViewController.m
//  TransitionExample1
//
//  Created by seirra on 08/07/2017.
//  Copyright © 2017 s2mh. All rights reserved.
//

#import "MyTableViewController.h"

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
//    self.tableView.rowHeight = 90.0f;
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, self.tableView.frame.size.width * 0.75)];
    headerView.image = self.header;
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.imageView.image = self.images[indexPath.row];
    cell.textLabel.text = @"text text text text text text";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25.0f * (indexPath.row % 4) + 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __FUNCTION__);
}

@end
