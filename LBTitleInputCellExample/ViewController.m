//
//  ViewController.m
//  LBTextFieldDemo
//
//  Created by 刘彬 on 2019/9/24.
//  Copyright © 2019 刘彬. All rights reserved.
//

#import "ViewController.h"
#import "LBTitleInputCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titleArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"LBTitleInputCell";
    _titleArray = @[@[@"姓名"],@[@"身份证"]];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titleArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_titleArray[section] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"LBTableViewCell";
    LBTitleInputCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LBTitleInputCell alloc] initWithReuseIdentifier:identifier titleArray:_titleArray font:[UIFont systemFontOfSize:16]];
        cell.titleLabel.frame = CGRectMake(15, CGRectGetMinX(cell.titleLabel.frame), CGRectGetWidth(cell.titleLabel.frame), CGRectGetHeight(cell.titleLabel.frame));
    }
    cell.titleLabel.text = _titleArray[indexPath.section][indexPath.row];
    cell.inputTextField.placeholder = _titleArray[indexPath.section][indexPath.row];

    return cell;
}

@end
