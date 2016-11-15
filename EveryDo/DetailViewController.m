//
//  DetailViewController.m
//  EveryDo
//
//  Created by Erin Luu on 2016-11-15.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDoTask.h"
@interface DetailViewController ()
@property ToDoTask * toDoItem;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_toDoItem != newDetailItem) {
        _toDoItem = newDetailItem;
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.toDoItem) {
        self.titleLabel.text = self.toDoItem.title;
        self.descrLabel.text = self.toDoItem.descr;
        if (self.toDoItem.isComplete) {
            self.activeLabel.text = @"Completed";
        } else {
            self.activeLabel.text = @"Not Complete";
        }
        switch (self.toDoItem.priority) {
            case 0:
                self.priorityLabel.text = @"Low";
                break;
            case 1:
                self.priorityLabel.text = @"Medium";
                break;
            case 2:
                self.priorityLabel.text = @"High";
                break;
            default:
                break;
        }
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
