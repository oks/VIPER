//
//  UIImageView+ANLoadingAdditions.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/20/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@interface UIImageView (ANLoadingAdditions)

- (void)an_updateWithURLString:(NSString*)urlString placeholder:(UIImage*)placeholder;

- (void)an_updateWithURLString:(NSString*)urlString
               placeholderName:(NSString*)placeholderName
                     height:(CGFloat)height;


@end
