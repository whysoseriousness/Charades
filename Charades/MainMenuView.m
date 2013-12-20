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
@synthesize friends, Refresh;

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
    NSString *Result = [[NSString alloc] initWithData:RetreivedResult encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@s", Result);
}

- (void) retrieveGames
{
    
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
    cell.textLabel.text = [self.friends objectAtIndex:[indexPath row]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

-(IBAction)Refresh:(id)sender
{
    [self retrieveFriends];
}


//Other Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self retrieveFriends];
    self.friends = [[NSArray alloc] initWithObjects:@"Dylan", @"Joshua", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end