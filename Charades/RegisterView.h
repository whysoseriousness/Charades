//
//  RegisterView.h
//  Charades
//
//  Created by Dylan Ellington on 12/17/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIViewController
{
    IBOutlet UITextField *Username_textfield;
    IBOutlet UITextField *Firstname_textfield;
    IBOutlet UITextField *Lastname_textfield;
    IBOutlet UITextField *Email_textfield;
    IBOutlet UITextField *Password_textfield;
}

@property(nonatomic, retain)IBOutlet UITextField *Username_textfield;
@property(nonatomic, retain)IBOutlet UITextField *Firstname_textfield;
@property(nonatomic, retain)IBOutlet UITextField *Lastname_textfield;
@property(nonatomic, retain)IBOutlet UITextField *Email_textfield;
@property(nonatomic, retain)IBOutlet UITextField *Password_textfield;

@property (strong,nonatomic) IBOutlet UIButton *Register;
@property (strong,nonatomic) IBOutlet UIButton *Cancel;

- (IBAction)Register:(id)sender;
- (IBAction)Cancel:(id)sender;

@end
