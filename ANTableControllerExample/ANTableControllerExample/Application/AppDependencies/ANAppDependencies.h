//
//  ANAppDependencies.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@interface ANAppDependencies : NSObject

- (void)initialApplicationSetup:(UIApplication *)application launchOptions:(NSDictionary*)options;

- (BOOL)handleOpenURL:(NSURL*)url inApplication:(NSString*)application;
- (void)handleApplicationDidBecomeActive;
- (void)handleApplicationWillTerminate;

- (void)handleApplicationDidRegisterForPushWithToken:(NSData*)token;
- (void)handleApplication:(UIApplication*)application didRecievePushNotification:(NSDictionary*)userInfo;

- (void)handleApplication:(UIApplication *)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings;

- (void)installRootViewControllerIntoWindow:(UIWindow *)window;

@end
