//
//  ANCrashlyticsWrapper.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 22/12/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "ANCrashlyticsAdapter.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@implementation ANCrashlyticsAdapter

+ (void)start
{
    [Fabric with:@[CrashlyticsKit]];
}

+ (void)updateUserDataWithID:(NSString*)userID username:(NSString*)username email:(NSString*)email
{
    [self updateUserIdentifier:userID];
    [[Crashlytics sharedInstance] setUserName:username];
    [[Crashlytics sharedInstance] setUserEmail:email];
}

+ (void)updateUserDataWithDictionary:(NSDictionary*)data
{
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        [data.allKeys enumerateObjectsUsingBlock:^(NSString* key, NSUInteger idx, BOOL *stop) {
            [[Crashlytics sharedInstance] setObjectValue:data[key] forKey:key];
        }];
    }
}

+ (void)updateUserIdentifier:(NSString*)userID
{
    [[Crashlytics sharedInstance] setUserIdentifier:userID];
}

@end
