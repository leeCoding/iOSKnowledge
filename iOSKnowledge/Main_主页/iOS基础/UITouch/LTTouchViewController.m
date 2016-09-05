//
//  LTTouchViewController.m
//  iOSKnowledge
//
//  Created by Jonny on 16/9/1.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTTouchViewController.h"

@interface LTTouchViewController ()

@end

@implementation LTTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initView];
}

#pragma mark - 初始化数据
- (void)initData {
    
    
}

#pragma mark - 初始化视图
- (void)initView {
    
    self.title = @"UITouch";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20.0, 100.0, 45.0, 45.0)];
    image.backgroundColor = [UIColor yellowColor];
    image.tag = 100;
    [self.view addSubview:image];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    NSLog(@" 开始");

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    NSLog(@" 结束");
    UITouch *touch = [touches anyObject];
    UIImageView *view1 = (UIImageView*)[self.view  viewWithTag:100];
    CGPoint point = [touch  locationInView:self.view];
    CGRect  frame = view1.frame;
    
    // 超出屏幕之后不能在移动
    if (point.x > 0 && point.x <= self.view.frame.size.width - 45.f && point.y > 64 && point.y <= self.view.frame.size.height - 45.f) {
        
        frame.origin = point;
        view1.frame = frame;
    }

    NSLog(@"view.x %f view.y  %f",view1.frame.origin.x ,view1.frame.origin.y);
    
    // 一定时间内获取点击次数
    UITouch *touchUp = [[event allTouches] anyObject];
    
    NSLog(@" 点击次数 %ld",touchUp.tapCount);
    
    // 触摸点
    NSLog(@"touch.x %f touch.y  %f",point.x ,point.y);
    
    // 上次触摸点
    CGPoint pointPrevious = [touch previousLocationInView:self.view];
    NSLog(@" pointPrevious.x %f  pointPrevious.y %f",pointPrevious.x,pointPrevious.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    NSLog(@" 移动");
    UITouch *touch = [touches anyObject];
    UIImageView *view1 = (UIImageView*)[self.view  viewWithTag:100];
    CGPoint point = [touch  locationInView:self.view];
    CGRect  frame = view1.frame;
   
    // 超出屏幕之后不能在移动
    if (point.x > 0 && point.x <= self.view.frame.size.width - 45.f && point.y > 64 && point.y <= self.view.frame.size.height - 45.f) {
        
        frame.origin = point;
        view1.frame = frame;
    }
    
    NSLog(@" point %f %f",point.x,point.y);
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    NSLog(@" 取消");
    
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
