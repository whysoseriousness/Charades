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
@property(nonatomic, retain)IBOutlet UITextField *Username_textfield;
@property(nonatomic, retain)IBOutlet UITextField *Password_textfield;

- (IBAction)Login:(id)sender;
- (IBAction)keyboardhide:(id)sender;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end

