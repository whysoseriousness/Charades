//
//  RegisterView.m
//  Charades
//
//  Created by Dylan Ellington on 12/17/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView ()

@end

@implementation RegisterView

@synthesize Username_textfield, Firstname_textfield, Lastname_textfield, Email_textfield, Password_textfield, Register, Cancel;

//Main Methods

-(IBAction)Register:(id)sender
{
    //Post Credentials
    NSString *AuthenticationRequest = [NSString stringWithFormat:@"http://dylanellington.com/charades/registeruser.php?username=%@&firstname=%@&lastname=%@&email=%@&password=%@", Username_textfield.text, Firstname_textfield.text, Lastname_textfield.text, Email_textfield.text, Password_textfield.text];
        
    //Retrieve Result
    NSData *RetreivedResult = [NSData dataWithContentsOfURL:[NSURL URLWithString:AuthenticationRequest]];
        
    //Put Returned Value Into String
    NSString *Result = [[NSString alloc] initWithData:RetreivedResult encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@s", Result);
   }

-(IBAction)Cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//Other Methods
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
