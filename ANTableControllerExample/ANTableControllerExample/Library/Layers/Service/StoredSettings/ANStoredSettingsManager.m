//
//  ANSystemSettingsManager.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 3/18/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

static NSString* const kIntroSkipped = @"introSkipped";

#import "ANStoredSettingsManager.h"
#import "NSDate+ANServerAdditions.h"
#import "NSObject+ANUserDefaults.h"

@implementation ANStoredSettingsManager

+ (instancetype)shared
{
    static id _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [self new];
    });
    return _sharedClient;
}

- (void)cleanSettings
{
    self.isSkipedIntro = NO;
}


#pragma mark - Intro

- (BOOL)isSkipedIntro
{
    return [[self an_dataSource] boolForKey:kIntroSkipped];
}

- (void)setIsSkipedIntro:(BOOL)isSkipedIntro
{
    [[self an_dataSource] setBool:isSkipedIntro forKey:kIntroSkipped];
    [[self an_dataSource] synchronize];
}


@end
