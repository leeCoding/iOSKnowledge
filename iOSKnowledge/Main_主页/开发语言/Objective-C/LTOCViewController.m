//
//  LTOCViewController.m
//  iOSKnowledge
//
//  Created by Jonny on 16/8/24.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTOCViewController.h"
#import "LTKVCViewController.h"
#import "LTKVOViewController.h"

@interface LTOCViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate
>

@property (nonatomic,strong)NSArray *titles;   ///< 标题
@end

@implementation LTOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initView];
}

- (void)initData {
    
    self.titles = @[@"面向对象",@"内存管理",@"Category",@"KVC",@"KVO",@"面向对象",@"Protocol",@"Block",@"Foundation框架"];
}

- (void)initView {
    
    self.title = @"Objective-C";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setReturnBtn];

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles == nil ? 0 :self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.titles[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:12];

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        
        [self.navigationController pushViewController:[LTKVCViewController new] animated:YES];
    } else if (indexPath.row == 4) {
        
        [self.navigationController pushViewController:[LTKVOViewController new] animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
