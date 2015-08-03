//
//  NSObject+SMSafeValues.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "NSObject+ANSafeValues.h"

@implementation NSObject (ANSafeValues)

+ (NSString*)an_safeString:(NSString*)value
{
    value = value ? : @"";
    return [NSString stringWithFormat:@"%@", value];
}

+ (NSDictionary*)an_safeDictionary:(NSDictionary*)dict
{
    dict = dict ? : @{};
    return dict; // TODO:
}

@end
