//
//  TS1GameView.m
//  Charades
//
//  Created by Dylan Ellington on 12/23/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import "Player1GameView.h"

@interface Player1GameView ()

@end

@implementation Player1GameView

@synthesize Back, turnstatus;

//Main Methods

-(IBAction)Back:(id)sender
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
    NSLog(@"%@", turnstatus);
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
