//
//  MasterViewController.m
//  EveryDo
//
//  Created by Erin Luu on 2016-11-15.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoTask.h"
#import "TaskTableViewCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.objects =[[NSMutableArray alloc] init];
    //Create toDoObjects
    [self.objects addObject: [[ToDoTask alloc] initWithTitle:@"Wash clothes" andDescr:@"Task Description Filler"]];
    [self.objects addObject: [[ToDoTask alloc] initWithTitle:@"Walk dog" andDescr:@"Task Description Filler"]];
    [self.objects addObject: [[ToDoTask alloc] initWithTitle:@"Change littler box" andDescr:@"Task Description Filler"]];
    [self.objects addObject: [[ToDoTask alloc] initWithTitle:@"Buy grocery" andDescr:@"Task Description Filler"]];
    [self.objects addObject: [[ToDoTask alloc] initWithTitle:@"Clean room" andDescr:@"Task Description Filler"]];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell" forIndexPath:indexPath];
    ToDoTask * task = self.objects[indexPath.row];
    
    switch (task.priority) {
        case 0:
            cell.priorityLabel.text = @"Low";
            break;
        case 1:
            cell.priorityLabel.text = @"Medium";
            break;
        case 2:
            cell.priorityLabel.text = @"High";
            break;
        default:
            break;
    }
    
    
    if (task.isComplete) {
        NSMutableAttributedString *attString=[[NSMutableAttributedString alloc]initWithString:task.title];
        [attString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:2] range:NSMakeRange(0,[attString length])];
        cell.taskTitleLabel.attributedText = attString;
        [attString replaceCharactersInRange:NSMakeRange(0, [attString length]) withString:task.descr];
        cell.taskDescrLabel.attributedText = attString;
    } else {
        cell.taskTitleLabel.text = task.title;
        cell.taskDescrLabel.text = task.descr;
    }
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
