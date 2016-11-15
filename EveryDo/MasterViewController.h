//
//  MasterViewController.h
//  EveryDo
//
//  Created by Erin Luu on 2016-11-15.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoTask.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController
@property ToDoTask * taskToAdd;
@end

