//
//  ContactsViewController.m
//  42cc
//
//  Created by Andrew on 02.07.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import "ContactsViewController.h"
#import "FBFriendPickerViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

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
	self.friendPickerController = [[FBFriendPickerViewController alloc]
								   initWithNibName:nil bundle:nil];
	self.friendPickerController.title = @"Friends";


	[self.friendPickerController loadData];
	self.friendPickerController.allowsMultipleSelection = NO;
	[self.view addSubview:self.friendPickerController.view];
//	[self.navigationController pushViewController:self.friendPickerController
//									 animated:true];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
