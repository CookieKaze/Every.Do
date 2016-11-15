//
//  AddTaskViewController.h
//  EveryDo
//
//  Created by Erin Luu on 2016-11-15.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;
@interface AddTaskViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property MasterViewController * mvc;

@end
