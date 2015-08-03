//
//  NSObject+ANRACAdditions.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/4/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "NSObject+ANRACAdditions.h"

@implementation NSObject (ANRACAdditions)

+ (void)an_handleSubcriber:(id<RACSubscriber>)subscriber withObject:(id)object error:(NSError*)error
{
    if (error)
    {
        [subscriber sendError:error];
    }
    else
    {
        [subscriber sendNext:object];
        [subscriber sendCompleted];
    }
}

@end
