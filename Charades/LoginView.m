//
//  ViewController.m
//
//  Created by Dylan Ellington on 11/27/12.
//  Copyright (c) 2012 Dylan Ellington. All rights reserved.
//

#import "LoginView.h"
#import "MainMenuView.h"

@interface LoginView ()

@end

@implementation LoginView

@synthesize Login, Username_textfield, Password_textfield;

//Login
-(IBAction)Login:(id)sender
{
    //Post Credentials
    NSString *AuthenticationRequest = [NSString stringWithFormat:@"http://dylanellington.com/charades/loginuser.php?username=%@&password=%@", Username_textfield.text, Password_textfield.text];
    
    //Retrieve Result
    NSData *RetreivedResult = [NSData dataWithContentsOfURL:[NSURL URLWithString:AuthenticationRequest]];
    
    //Put Returned Value Into String
    NSString *Result = [[NSString alloc] initWithData:RetreivedResult encoding:NSUTF8StringEncoding];
    
    //Validate Posted Credentials
    if ([Result isEqualToString:@"success"])
    {
        [self performSegueWithIdentifier:@"login" sender:sender];
    }
    else
    {
        //Failed Present Error
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Incorrect Username or Password" message:@"" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
        
        [alertview show];
        [alertview release];
        return;
        
    }
}

//Other Methods
-(IBAction)keyboardhide:(id)sender
{
    [sender resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"login"]) {
          MainMenuView *mainmenu = [segue destinationViewController];
     //   mainmenu.self.name = Username_textfield.text; //example how to pass info to next view
     //   NSLog(@"%@", mainmenu.name);
    }
}

//Standard View Options
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
