//
//  ANMessageDomainModel.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/21/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANMessageDomainModel.h"

@implementation ANMessageDomainModel

- (NSArray*)recipients
{
    if (!_recipients)
    {
        _recipients = [NSArray new];
    }
    return _recipients;
}

- (NSString*)message
{
    if (!_message)
    {
        _message = @"";
    }
    return _message;
}

- (NSString*)title
{
    if (!_title)
    {
        _title = @"";
    }
    return _title;
}

@end
