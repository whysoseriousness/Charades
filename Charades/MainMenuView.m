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

@synthesize name;

- (void)viewDidLoad
{
    NSLog(@"%@",name);
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end