//
//  LTiOSBaseViewController.m
//  iOSKnowledge
//
//  Created by Jonny on 16/9/1.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTiOSBaseViewController.h"
#import "LTTouchViewController.h"
#import "LTGestureViewController.h"

@interface LTiOSBaseViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic,strong)NSArray *titles;   ///< 标题

@end

@implementation LTiOSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initView];
}

#pragma mark - 初始化数据
- (void)initData {
 
    self.titles = @[@"UITouch",@"UIGesture"];
    
}

#pragma mark - 初始化视图
- (void)initView {
 
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor yellowColor];
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
        [self.navigationController pushViewController:[LTTouchViewController new] animated:YES];

    }else if (indexPath.row == 1){
        
        [self.navigationController pushViewController:[LTGestureViewController new] animated:YES];
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
