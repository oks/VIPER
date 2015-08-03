//
//  ANCategoryDomainModel.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoryDomainModel.h"

const struct ANCategoryDomainModelAttributes ANCategoryDomainModelAttributes = {
    .name = @"name",
    .imageURLString = @"imageURLString",
};

@implementation ANCategoryDomainModel

+ (instancetype)categoryWithName:(NSString*)name imageURLString:(NSString*)URLString
{
    ANCategoryDomainModel* model = [self new];
    model.name = name;
    model.imageURLString = URLString;
    
    return model;
}

@end
