//
//  ANCrashlyticsWrapper.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 22/12/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

static NSString* kANCrashlyticsKey;

@interface ANCrashlyticsAdapter : NSObject

+ (void)start;
+ (void)updateUserIdentifier:(NSString*)userID;
+ (void)updateUserDataWithID:(NSString*)userID username:(NSString*)username email:(NSString*)email;
+ (void)updateUserDataWithDictionary:(NSDictionary*)data;

@end
