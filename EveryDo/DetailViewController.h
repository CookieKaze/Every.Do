//
//  DetailViewController.h
//  EveryDo
//
//  Created by Erin Luu on 2016-11-15.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) IBOutlet UILabel *priorityLabel;
@property (nonatomic) IBOutlet UILabel *activeLabel;
@property (nonatomic) IBOutlet UITextView *descrLabel;

@end

