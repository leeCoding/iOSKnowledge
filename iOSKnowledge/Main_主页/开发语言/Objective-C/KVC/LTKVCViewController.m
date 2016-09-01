//
//  LTKVCViewController.m
//  iOSKnowledge
//
//  Created by Jonny on 16/8/24.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTKVCViewController.h"
#import "LTPerson.h"
#import "LTCourse.h"

@interface LTKVCViewController ()

@end

@implementation LTKVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initView];
}

#pragma mark - 初始化数据
- (void)initData {
    
    
    /**
        KVC
     */
    
    LTPerson *person = [[LTPerson alloc]init];
    [person setValue:@"Jonny" forKey:@"name"];
    NSString *name = [person valueForKey:@"name"];
    
    NSLog(@" 姓名： %@",name);
    
    /**
        类嵌套类
     */
    
    LTCourse *course = [[LTCourse alloc]init];
    [course setValue:@"语文" forKey:@"courseName"];
    [person setValue:course forKey:@"course"];
    
    // 两种取值方式
    
    /**
     *  1.先取出持有的类，在取出值
     */
    LTCourse *coursTest = [person valueForKey:@"course"];
    NSLog(@" 课程名字%@",[coursTest valueForKey:@"courseName"]);
    
    /**
     *  2.直接打点取值 根据path
     */
    [person setValue:@"数学课" forKeyPath:@"course.courseName"];
    NSString *courseName1 = [person valueForKeyPath:@"course.courseName"];
    NSLog(@" 课程名字%@",courseName1);
    
    /**
     *  使用集合
     */
    [person setValue:@[@"Zhang",@"Li"] forKey:@"otherStudent"];
    NSArray *names = [person valueForKey:@"otherStudent"];
    NSLog(@" 学生名字%@",names);
}

#pragma mark - 初始化视图
- (void)initView {
    
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
