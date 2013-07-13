//
//  MainInfoViewController.m
//  42cc
//
//  Created by Andrew on 26.06.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import "MainInfoViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"
#import "Person.h"

@interface MainInfoViewController ()

@end

@implementation MainInfoViewController

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
	
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(sessionStateChanged:)
	 name:sessionStateChangedNotification
	 object:nil];
	
	if (FBSession.activeSession.isOpen) {
        [self populateUserDetails];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateUserDetails
{
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error)
			 {
				 Person *person = [Person MR_findFirstByAttribute:@"identifier" withValue:user.id];

				 if (person == nil)
				 {
					 //Create new entity and set properties
					 Person *newPerson = [Person MR_createEntity];
					 newPerson.lastName = user.last_name;
					 newPerson.firstName = user.first_name;
					 newPerson.identifier = user.id;
//					 newPerson.avatar = [UIImage imageNamed:@"avatar"];
					 
					 //Save to persistant storage
					 [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
					 
					 person = [Person MR_findFirstByAttribute:@"identifier" withValue:user.id];
				 }
				 self.userID = user.id;
//                 self.userNameLabel.text = [NSString stringWithFormat:@"%@ %@", person.lastName, person.firstName];
				 self.userNameTextField.text = [NSString stringWithFormat:@"%@ %@", person.lastName, person.firstName];
                 self.userProfileImage.profileID = person.identifier;
             }
         }];
    }
}

- (void)sessionStateChanged:(NSNotification*)notification
{
    [self populateUserDetails];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.userNameTextField  resignFirstResponder];
    return YES;
}

- (IBAction)saveUserName:(id)sender
{
	Person *person = [Person MR_findFirstByAttribute:@"identifier" withValue:self.userID];
	if (person)
	{
		if ([self.userNameTextField.text length] != 0)
		{
			person.lastName = self.userNameTextField.text;
		}
		else
		{
			self.userNameTextField.text = [NSString stringWithFormat:@"%@ %@", person.lastName, person.firstName];	
		}
	}

}
@end
