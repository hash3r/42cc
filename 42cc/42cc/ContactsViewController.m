//
//  ContactsViewController.m
//  42cc
//
//  Created by Andrew on 02.07.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import "ContactsViewController.h"
#import "FBFriendPickerViewController.h"

@interface ContactsViewController () <FBFriendPickerDelegate>

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
	self.friendPickerController.delegate = self;

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

- (void)friendPickerViewControllerSelectionDidChange:(FBFriendPickerViewController *)friendPicker
{
	if (friendPicker.selection.count != 0)
	{
		NSDictionary *selectedFriend = friendPicker.selection[0];
		if (selectedFriend)
		{
			NSString *urlStr = [NSString stringWithFormat:@"fb://profile/%@", selectedFriend[@"id"]];
			NSString *escaped = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
			NSURL *url = [NSURL URLWithString:escaped];
			if ([[UIApplication sharedApplication] canOpenURL:url])
			{
				[[UIApplication sharedApplication] openURL:url];
			}
			else
			{
				urlStr = [NSString stringWithFormat:@"http://www.facebook.com/%@", selectedFriend[@"id"]];
				escaped = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
				url = [NSURL URLWithString:escaped];
				if ([[UIApplication sharedApplication] canOpenURL:url])
				{
					[[UIApplication sharedApplication] openURL:url];
				}
			}
			[friendPicker clearSelection];
		}
	}
}

@end
