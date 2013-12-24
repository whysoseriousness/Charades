//
//  ViewController.m
//  Charades
//
//  Created by Joshua Martin on 9/19/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import "MainMenuView.h"
#import "TS1GameView.h"
#import "TS2GameView.h"

@interface MainMenuView ()

@end

@implementation MainMenuView
@synthesize friends, games, Friends_Games_Add, Friends_Games_Selector;

//Variables
int userid = 1;

//Main Methods

- (void) retrieveFriends
{
    //Post Credentials
    NSString *AuthenticationRequest = [NSString stringWithFormat:@"http://dylanellington.com/charades/friends.php?userid=%d", userid];
    
    //Retrieve Result
    NSData *RetreivedResult = [NSData dataWithContentsOfURL:[NSURL URLWithString:AuthenticationRequest]];
    
    //Parse Data Into Array
    NSError* error;
    NSArray* json = [NSJSONSerialization JSONObjectWithData:RetreivedResult options:kNilOptions error:&error];
    
    if( json && ![[NSString stringWithFormat:@"%@", [json objectAtIndex:0] ] isEqualToString:@"<null>"])
    {
        self.friends = [json objectAtIndex: 0];
        [self.tableView reloadData];
    }
}

- (void) retrieveGames
{
    //Post Credentials
    NSString *AuthenticationRequest = [NSString stringWithFormat:@"http://dylanellington.com/charades/games.php?userid=%d", userid];
    
    //Retrieve Result
    NSData *RetreivedResult = [NSData dataWithContentsOfURL:[NSURL URLWithString:AuthenticationRequest]];
    
    //Parse Data Into Array
    NSError* error;
    NSArray* json = [NSJSONSerialization JSONObjectWithData:RetreivedResult options:kNilOptions error:&error];
    
    if( json && ![[NSString stringWithFormat:@"%@", [json objectAtIndex:0] ] isEqualToString:@"<null>"])
    {
        self.games = [json objectAtIndex: 0];
        [self.tableView reloadData];
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.Friends_Games_Selector.selectedSegmentIndex == 0)
    {
        return [self.friends count];
    }
    if (self.Friends_Games_Selector.selectedSegmentIndex == 1)
    {
        return [self.games count];
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ( cell == nil )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (self.Friends_Games_Selector.selectedSegmentIndex == 0)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.friends objectAtIndex:[indexPath row]] objectForKey:@"friendusername"]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;
    }
    if (self.Friends_Games_Selector.selectedSegmentIndex == 1)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.games objectAtIndex:[indexPath row]] objectForKey:@"opponentid"]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (self.Friends_Games_Selector.selectedSegmentIndex == 1)
    {
        NSString *turnstatus = [NSString stringWithFormat:@"%@", [[self.games objectAtIndex:[indexPath row]] objectForKey:@"turnstatus"]];
        
        NSString *segueidentifier = [NSString stringWithFormat:@"%@%@", @"TS", turnstatus];

        [self performSegueWithIdentifier:segueidentifier sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (self.Friends_Games_Selector.selectedSegmentIndex == 1)
    {
        if ([segue.identifier isEqualToString:@"TS1"])
        {
            TS1GameView *ts1gameview = (TS1GameView *)[segue destinationViewController];
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *gameid = [[self.games objectAtIndex:[indexPath row]] objectForKey:@"gameid"];
            ts1gameview.gameidts1 = gameid;
        }
        if ([segue.identifier isEqualToString:@"TS2"])
        {
           //pass data when needed
        }
    }
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
        UIAlertView * creategame = [[UIAlertView alloc] initWithTitle:@"Create Game" message:@"Enter your opponents username." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Create", nil];
        
        creategame.alertViewStyle = UIAlertViewStylePlainTextInput;
        [creategame show];
        [creategame release];
    }
}

- (void)alertView:(UIAlertView *)friends_games_add clickedButtonAtIndex:(NSInteger)buttonindex
{

    if (self.Friends_Games_Selector.selectedSegmentIndex == 0)
    {
        if (buttonindex == 1)
        {
            NSString *username = [friends_games_add textFieldAtIndex:0].text;
            NSString *AuthenticationRequest = [NSString stringWithFormat:@"http://dylanellington.com/charades/addfriend.php?userid=%d&friendusername=%@", userid, username];
        
            NSData *RetreivedResult = [NSData dataWithContentsOfURL:[NSURL URLWithString:AuthenticationRequest]];
        
            NSString *Result = [[NSString alloc] initWithData:RetreivedResult encoding:NSUTF8StringEncoding];
        
            if ([Result isEqualToString: @"Success."])
            {
                [self retrieveFriends];
            }
        
            if ([Result isEqualToString: @"You are already friends with this user."])
            {
                UIAlertView * addfrienderror = [[UIAlertView alloc] initWithTitle:@"You're Already Friends With This User" message:@"" delegate:self cancelButtonTitle:@"Hide" otherButtonTitles: nil];
            
                addfrienderror.alertViewStyle = UIAlertViewStyleDefault;
                [addfrienderror show];
                [addfrienderror release];
            }

            if ([Result isEqualToString: @"Username doesn't exist."])
            {
                UIAlertView * addfrienderror = [[UIAlertView alloc] initWithTitle:@"Username Doesn't Exist" message:@"" delegate:self cancelButtonTitle:@"Hide" otherButtonTitles: nil];
            
                addfrienderror.alertViewStyle = UIAlertViewStyleDefault;
                [addfrienderror show];
                [addfrienderror release];
            }
        }
    }
    
    if (self.Friends_Games_Selector.selectedSegmentIndex == 1)
    {
        if (buttonindex == 1)
        {
            NSString *username = [friends_games_add textFieldAtIndex:0].text;
            NSString *AuthenticationRequest = [NSString stringWithFormat:@"http://dylanellington.com/charades/creategame.php?userid=%d&friendusername=%@", userid, username];
            
            NSData *RetreivedResult = [NSData dataWithContentsOfURL:[NSURL URLWithString:AuthenticationRequest]];
        
            NSString *Result = [[NSString alloc] initWithData:RetreivedResult encoding:NSUTF8StringEncoding];
        
            if ([Result isEqualToString: @"Success."])
            {
                [self retrieveGames];
            }
        
            if ([Result isEqualToString: @"A game is already in progress."])
            {
                UIAlertView * creategameerror = [[UIAlertView alloc] initWithTitle:@"A Game Already Exists With This User" message:@"" delegate:self cancelButtonTitle:@"Hide" otherButtonTitles: nil];
            
                creategameerror.alertViewStyle = UIAlertViewStyleDefault;
                [creategameerror show];
                [creategameerror release];
            }
        }
    }
}

//Other Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friends = [NSArray arrayWithObject:[NSDictionary dictionaryWithObject:@"" forKey:@"friendusername"] ];
    self.games = [NSArray arrayWithObject:[NSDictionary dictionaryWithObject:@"" forKey:@"opponenetid"] ];
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