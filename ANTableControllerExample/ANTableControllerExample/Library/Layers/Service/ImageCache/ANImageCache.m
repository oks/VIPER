//
//  ANImageSaver.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 5/15/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "ANImageCache.h"
#import "SDImageCache.h"

static NSString* const kCacheFormatName = @"mobi.anoda.table-controlller";
static NSString* const kCacheName = @"images";

@interface ANImageCache ()

@end

@implementation ANImageCache

#pragma mark - Public

+ (NSString*)saveImage:(UIImage*)image
{
    NSString* key = [NSString stringWithFormat:@"userPhoto-%d", rand()];
    [[SDImageCache sharedImageCache] storeImage:image forKey:key toDisk:YES];
    return key;
}

+ (UIImage*)imageWithKey:(NSString*)key
{
    if (!key)
    {
        return nil;
    }
    return [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
}

+ (void)saveImage:(UIImage *)image key:(NSString *)key
{
    if (!key | !image)
    {
        return;
    }
    [[SDImageCache sharedImageCache] storeImage:image forKey:key toDisk:YES];
}

@end
