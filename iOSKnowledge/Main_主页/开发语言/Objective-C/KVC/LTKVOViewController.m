//
//  LTKVOViewController.m
//  iOSKnowledge
//
//  Created by Jonny on 16/8/25.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTKVOViewController.h"
#import "LTPageView.h"
#import "LTPerson.h"

@interface LTKVOViewController ()

@end

@implementation LTKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initView];
}

#pragma mark - 初始化数据
- (void)initData {
    
    LTPerson *person = [LTPerson new];
    [person changeCourseName:@"语文"];
    
    LTPageView *pageView = [[LTPageView alloc]initPerson:person];
    pageView.backgroundColor = [UIColor yellowColor];
    [person setValue:@"数学" forKey:@"courseName"];
    
    /**
     *  直接改变 只有通过键值对改变，才能触发回调
     */
    [person changeCourseName:@"英语"];
}

#pragma mark - 初始化视图
- (void)initView {
    
    self.title = @"KVO";
    self.view.backgroundColor = [UIColor whiteColor];
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
