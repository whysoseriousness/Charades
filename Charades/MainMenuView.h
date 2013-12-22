//
//  ViewController.h
//  Charades
//
//  Created by Joshua Martin on 9/19/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuView : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *friends;
    UISegmentedControl *Friends_Games_Selector;
}

@property (strong, nonatomic) IBOutlet UIButton *Friends_Games_Add;
@property (strong, nonatomic) IBOutlet UISegmentedControl *Friends_Games_Selector;
@property (strong, nonatomic) NSArray *friends;

- (IBAction)Friends_Games_Load:(id)sender;
- (IBAction)Friends_Games_Add:(id)sender;

@end