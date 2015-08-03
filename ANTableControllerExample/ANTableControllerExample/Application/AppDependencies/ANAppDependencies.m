//
//  ANAppDependencies.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAppDependencies.h"
#import "ANRootWireframe.h"
#import "ANAppColorTheme.h"

@interface ANAppDependencies ()

@property (nonatomic, strong) ANRootWireframe* rootWireframe;

@end

@implementation ANAppDependencies

- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.rootWireframe showStartViewControllerInWindow:window];
}

- (void)initialApplicationSetup:(UIApplication *)application launchOptions:(NSDictionary *)options
{
    [ANAppColorTheme shared];
}

- (BOOL)handleOpenURL:(NSURL*)url inApplication:(NSString*)application
{
    return NO;
}

- (void)handleApplicationDidBecomeActive
{
    
}

- (void)handleApplicationWillTerminate
{

}


#pragma mark - Push

- (void)handleApplicationDidRegisterForPushWithToken:(NSData *)token
{

}

- (void)handleApplication:(UIApplication *)application didRecievePushNotification:(NSDictionary *)userInfo
{

}

- (void)handleApplication:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{

}


#pragma mark - Private

- (ANRootWireframe *)rootWireframe
{
    if (!_rootWireframe)
    {
        _rootWireframe = [ANRootWireframe new];
    }
    return _rootWireframe;
}

@end
