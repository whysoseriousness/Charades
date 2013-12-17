//
//  ViewController.h
//  Admissions Portal
//
//  Created by Dylan Ellington on 11/27/12.
//  Copyright (c) 2012 Dylan Ellington. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIViewController
{
    IBOutlet UITextField *Username_textfield;
    IBOutlet UITextField *Password_textfield;
}

@property (strong,nonatomic) IBOutlet UIButton *Login;
@property (strong,nonatomic) IBOutlet UIButton *Register;
@property(nonatomic, retain)IBOutlet UITextField *Username_textfield;
@property(nonatomic, retain)IBOutlet UITextField *Password_textfield;

- (IBAction)Login:(id)sender;
- (IBAction)Register:(id)sender;

@end

