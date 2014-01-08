//
//  Player2GameView.m
//  Charades
//
//  Created by Dylan Ellington on 12/23/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import "Player2GameView.h"

@interface Player2GameView ()

@end

@implementation Player2GameView

@synthesize Back;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
