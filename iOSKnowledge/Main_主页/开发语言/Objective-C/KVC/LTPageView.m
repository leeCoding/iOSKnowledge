//
//  LTPageView.m
//  iOSKnowledge
//
//  Created by Jonny on 16/8/25.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTPageView.h"
#import "LTPerson.h"

@implementation LTPageView

- (instancetype)initPerson:(LTPerson *)initPerson
{
    self = [super init];
    if (self) {
        
        person = initPerson;
        [person addObserver:self forKeyPath:@"courseName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {

    [person removeObserver:self forKeyPath:@"courseName" context:nil];
}

#pragma mark - 观察者回调

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"courseName"]) {
        
        NSString *new = [change objectForKey:@"new"];
        NSString *old = [change objectForKey:@"old"];
        NSLog(@" 字典呐 %@",change);
        NSLog(@"值已经改变 改变之后的值是%@  老课程名字 %@",new,old);
        
    }
}

@end
