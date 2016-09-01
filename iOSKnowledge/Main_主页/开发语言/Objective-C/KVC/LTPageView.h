//
//  LTPageView.h
//  iOSKnowledge
//
//  Created by Jonny on 16/8/25.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTPerson;

@interface LTPageView : UIView
{
    LTPerson *person;
}

- (instancetype)initPerson:(LTPerson *)initPerson;

@end
