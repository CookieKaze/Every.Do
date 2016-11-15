//
//  AddTaskViewController.m
//  EveryDo
//
//  Created by Erin Luu on 2016-11-15.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "AddTaskViewController.h"
#import "ToDoTask.h"
#import "MasterViewController.h"

@interface AddTaskViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descrTextView;
@property (weak, nonatomic) IBOutlet UIPickerView *priorityPicker;
@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.priorityPicker.delegate = self;
    self.priorityPicker.dataSource = self;
}

- (IBAction)createTask:(UIButton *)sender {
    ToDoTask * task = [[ToDoTask alloc] initWithTitle: self.titleTextField.text andDescr: self.descrTextView.text andPriority: (priorityLevel)[self.priorityPicker selectedRowInComponent:0]];
    self.mvc.taskToAdd = task;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Setup PickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * priorityText;
    
    switch (row) {
        case 0:
            priorityText = @"Low";
            break;
        case 1:
            priorityText = @"Medium";
            break;
        case 2:
            priorityText = @"High";
            break;
        default:
            break;
    }
    return priorityText;
}

#pragma mark - Keyboard Resign
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.titleTextField resignFirstResponder];
    [self.descrTextView resignFirstResponder];
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

@end
