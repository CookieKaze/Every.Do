//
//  ToDoTask.h
//  EveryDo
//
//  Created by Erin Luu on 2016-11-15.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum priorityLevel{
    Low,
    Medium,
    High
} priorityLevel;

@interface ToDoTask : NSObject

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * descr;
@property (nonatomic) priorityLevel priority;
@property (nonatomic) BOOL isComplete;


- (instancetype)initWithTitle: (NSString *) title andDescr: (NSString * ) descr andPriority: (priorityLevel) priority;

@end
