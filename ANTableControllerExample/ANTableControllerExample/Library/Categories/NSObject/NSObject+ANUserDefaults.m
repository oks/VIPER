//
//  NSObject+ANUserDefaults.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 5/17/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "NSObject+ANUserDefaults.h"

@implementation NSObject (ANUserDefaults)

#pragma mark - Private

- (NSUserDefaults *)an_dataSource
{
    return [NSUserDefaults standardUserDefaults];
}

- (void)an_updateObject:(id)object forKey:(NSString*)key
{
    if (object)
    {
        [[self an_dataSource] setObject:object forKey:key];
    }
    else
    {
        [[self an_dataSource] removeObjectForKey:key];
    }
    [[self an_dataSource] synchronize];
}

- (NSString*)an_stringForKey:(NSString*)key
{
    NSString* string = [[self an_dataSource] objectForKey:key];
    return string ? : @"";
}

@end
