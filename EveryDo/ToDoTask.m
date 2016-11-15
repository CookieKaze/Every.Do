//
//  ToDoTask.m
//  EveryDo
//
//  Created by Erin Luu on 2016-11-15.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ToDoTask.h"

@implementation ToDoTask

- (instancetype)initWithTitle: (NSString *) title andDescr: (NSString * ) descr
{
    self = [super init];
    if (self) {
        _title = title;
        _descr = descr;
        _isComplete = NO;
        _priority = Low;
    }
    return self;
}

@end
