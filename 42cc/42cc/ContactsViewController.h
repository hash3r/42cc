//
//  ContactsViewController.h
//  42cc
//
//  Created by Andrew on 02.07.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FBFriendPickerViewController;

@interface ContactsViewController : UIViewController

@property (strong, nonatomic) FBFriendPickerViewController *friendPickerController;

@end
