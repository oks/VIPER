//
//  UIImage+ANDefault.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 3/7/15.
//  Copyright (c) 2015 Oksana Kovalchuk. All rights reserved.
//

#import "UIImage+ANDefault.h"

static NSString* const kDefaultIphone6 = @"LaunchImage-800-667h@2x.png";
static NSString* const kDefaultIphone6Plus = @"LaunchImage-800-Portrait-736h@3x.png";
static NSString* const kDefaultIphone5 = @"LaunchImage-700-568h";
static NSString* const kDefaultIphone4 = @"LaunchImage-700";


@implementation UIImage (ANDefault)

+ (UIImage*)an_defaultImage
{
    UIImage* result;
    if (IS_IPHONE_6)
    {
        result = [UIImage imageNamed:kDefaultIphone6];
    }
    else if (IS_IPHONE_6_PLUS)
    {
        result = [UIImage imageNamed:kDefaultIphone6Plus];
    }
    else if (IS_IPHONE_5)
    {
        result = [UIImage imageNamed:kDefaultIphone5];
    }
    else
    {
        result = [UIImage imageNamed:kDefaultIphone4];
    }
    return result;
}

@end
