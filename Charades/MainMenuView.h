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
}

@property (strong,nonatomic) IBOutlet UIButton *Refresh;
@property (strong, nonatomic) NSArray *friends;

-(IBAction)Refresh:(id)sender;

@end