//
//  ANSystemSettingsManager.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 3/18/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

@interface ANStoredSettingsManager : NSObject

//global settings
@property (nonatomic, assign) BOOL isSkipedIntro;

+ (instancetype)shared;
- (void)cleanSettings;

@end
