//
//  LTMainViewController.m
//  iOSKnowledge
//
//  Created by Jonny on 16/8/24.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTMainViewController.h"
#import "LTDevelopmentLanguageViewController.h"
#import "LTiOSBaseViewController.h"

@interface LTMainViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic,strong)NSArray *titles;   ///< 标题

@end

@implementation LTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initView];
}

- (void)initData {
    
    self.titles = @[@"开发语言",@"iOS基础",@"iOS高级",@"热门技术",@"热门第三方",@"系统框架"];
}

- (void)initView {
    
    self.title = @"iOS开发知识";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles == nil ? 0 : self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        LTDevelopmentLanguageViewController *develop = [LTDevelopmentLanguageViewController new];
        [self.navigationController pushViewController:develop animated:YES];
        
    } else if (indexPath.row == 1) {
    
        [self.navigationController pushViewController:[LTiOSBaseViewController new] animated:YES];

        
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
