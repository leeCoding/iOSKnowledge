//
//  LTPerson.m
//  iOSKnowledge
//
//  Created by Jonny on 16/8/24.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "LTPerson.h"
#import "LTCourse.h"
@implementation LTPerson
{
    NSString *name;
    NSString *sex;
    LTCourse *course;
    NSArray *otherStudent;
    
    NSString *courseName;
}

- (void)changeCourseName:(NSString *)newCourseName {
    
    courseName = newCourseName;
}

@end
