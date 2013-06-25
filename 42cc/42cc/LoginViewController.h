//
//  LoginViewController.h
//  42cc
//
//  Created by Andrew on 25.06.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;

- (IBAction)loginClicked:(id)sender;
- (void)loginFailed;

@end
