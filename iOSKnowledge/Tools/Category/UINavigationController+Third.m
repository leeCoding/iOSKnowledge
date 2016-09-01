//
//  UINavigationController+Third.m
//  iOSKnowledge
//
//  Created by Jonny on 16/8/24.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "UINavigationController+Third.h"

@implementation UINavigationController (Third)

- (void)setReturnBtn {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"返回" forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitleColor:[UIColor blackColor] forState:0];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

- (void)pop {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
