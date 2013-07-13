//
//  AboutViewController.h
//  42cc
//
//  Created by Andrew on 26.06.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const lastName;
extern NSString *const firstName;
extern NSString *const identifier;

@interface AboutViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dateOfBirth;
@property (strong, nonatomic) IBOutlet UILabel *info;
@property (strong, nonatomic) IBOutlet UILabel *lastName;
@property (strong, nonatomic) IBOutlet UILabel *firstName;
@property (strong, nonatomic) IBOutlet UIImageView *avatar;

@end
