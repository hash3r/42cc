//
//  AboutViewController.m
//  42cc
//
//  Created by Andrew on 26.06.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import "AboutViewController.h"
#import "Person.h"

NSString *const lastName = @"Mike";
NSString *const firstName = @"Ash";
NSString *const identifier = @"1";

@interface AboutViewController ()

@end

@implementation AboutViewController

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
	[self loadPersonalInfo];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadPersonalInfo
{
	Person *person = [Person MR_findFirstByAttribute:@"identifier" withValue:identifier];

	if (person == nil)
	{
		//Create new entity and set properties
		Person *newPerson = [Person MR_createEntity];
		newPerson.lastName = lastName;
		newPerson.firstName = firstName;
		newPerson.identifier = identifier;
		newPerson.avatar = [UIImage imageNamed:@"avatar"];
	
		//Save to persistant storage
		[[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
		
		person = [Person MR_findFirstByAttribute:@"identifier" withValue:identifier];
	}
	
	self.lastName.text = person.lastName;
	self.firstName.text = person.firstName;
	self.avatar.image = person.avatar;
	
}
@end
