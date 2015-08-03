//
//  ANErrorBuilder+Private.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 2/2/15.
//  Copyright (c) 2015 ANTableControllerExample. All rights reserved.
//

@interface ANErrorBuilder (PrivateSetup)

+ (NSDictionary*)_userInfoByTable:(NSString*)table errorCode:(NSInteger)errorCode;
+ (NSString*)_errorDescriptionWithCode:(NSInteger)code;
+ (NSString*)_errorReasonWithCode:(NSInteger)code;

@end
