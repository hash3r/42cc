//
//  MainInfoViewController.h
//  42cc
//
//  Created by Andrew on 26.06.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FBProfilePictureView;

@interface MainInfoViewController : UIViewController

@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@end
