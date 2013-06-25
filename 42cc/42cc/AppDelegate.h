//
//  AppDelegate.h
//  42cc
//
//  Created by Andrew on 25.06.13.
//  Copyright (c) 2013 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController* navController;
@property (strong, nonatomic) MainViewController *mainViewController;

- (void)openSession;

@end
