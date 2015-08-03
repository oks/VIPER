//
//  ANImageSaver.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 5/15/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

@interface ANImageCache : NSObject

+ (NSString*)saveImage:(UIImage*)image;
+ (void)saveImage:(UIImage*)image key:(NSString*)key;
+ (UIImage*)imageWithKey:(NSString*)key;

@end
