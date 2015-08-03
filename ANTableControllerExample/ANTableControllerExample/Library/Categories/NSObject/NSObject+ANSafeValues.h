//
//  NSObject+SMSafeValues.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@interface NSObject (ANSafeValues)

+ (NSString*)an_safeString:(NSString*)value;
+ (NSDictionary*)an_safeDictionary:(NSDictionary*)dict;

@end
