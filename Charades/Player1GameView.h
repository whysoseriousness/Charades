//
//  Player1GameView.h
//  Charades
//
//  Created by Dylan Ellington on 12/23/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Player1GameView : UIViewController
{
    
}

@property (nonatomic, strong) NSString *turnstatus;
@property (strong,nonatomic) IBOutlet UIButton *Back;

- (IBAction)Back:(id)sender;

@end
