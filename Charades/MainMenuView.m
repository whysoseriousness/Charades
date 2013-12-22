//
//  ViewController.m
//  Charades
//
//  Created by Joshua Martin on 9/19/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import "MainMenuView.h"

@interface MainMenuView ()

@end

@implementation MainMenuView
@synthesize friends, Friends_Games_Add, Friends_Games_Selector;

//Variables
int userid = 1;

//Main Methods

- (void) retrieveFriends
{
    //Post Credentials
    NSString *AuthenticationRequest = [NSString stringWithFormat:@"http://dylanellington.com/charades/friends.php?userid=%d", userid];
    
    //Retrieve Result
    NSData *RetreivedResult = [NSData dataWithContentsOfURL:[NSURL URLWithString:AuthenticationRequest]];
    
    //Put Returned Value Into String
    //NSString *Result = [[NSString alloc] initWithData:RetreivedResult encoding:NSUTF8StringEncoding];
    
    NSError* error;
    NSArray* json = [NSJSONSerialization
                          JSONObjectWithData:RetreivedResult //1
                          
                          options:kNilOptions
                          error:&error];
 
    self.friends = [json objectAtIndex:0];
    
    [self.tableView reloadData];
    
//    NSLog(@"%@", [json objectAtIndex:0]);
}

- (void) retrieveGames
{
    NSLog(@"%@", @"No Games Found");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.friends count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ( cell == nil )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    cell.textLabel.text = [[self.friends objectAtIndex:[indexPath row]] objectForKey:@"friendusername"];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (IBAction)Friends_Games_Load:(id)sender
{
    if (self.Friends_Games_Selector.selectedSegmentIndex == 0)
    {
        [self retrieveFriends];
    }
    if (self.Friends_Games_Selector.selectedSegmentIndex == 1)
    {
        [self retrieveGames];
    }
}

-(IBAction)Friends_Games_Add:(id)sender
{
    if (self.Friends_Games_Selector.selectedSegmentIndex == 0)
    {
        UIAlertView * addfriend = [[UIAlertView alloc] initWithTitle:@"Add Friend" message:@"Enter the username you'd like to add as a friend." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
        
        addfriend.alertViewStyle = UIAlertViewStylePlainTextInput;
        [addfriend show];
        [addfriend release];
    }
    
    if (self.Friends_Games_Selector.selectedSegmentIndex == 1)
    {
        //Create Game
    }
}

- (void)alertView:(UIAlertView *)addfriend clickedButtonAtIndex:(NSInteger)buttonindex
{
    if (buttonindex == 1)
    {
        NSString *username = [addfriend textFieldAtIndex:0].text;
        NSLog(@"%@", username);
    }
}

//Other Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friends = [[NSArray alloc] initWithObjects:@"", nil];
    NSDictionary * currentUser = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"];
    userid = [[currentUser objectForKey:@"userid"] intValue];
    [self retrieveFriends];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end