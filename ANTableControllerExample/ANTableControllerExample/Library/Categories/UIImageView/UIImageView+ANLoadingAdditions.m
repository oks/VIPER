//
//  UIImageView+ANLoadingAdditions.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/20/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "UIImageView+ANLoadingAdditions.h"
#import "ANAnimator.h"
#import "UIImageView+WebCache.h"
#import "UIImage+ANAdditions.h"
#import "UIImage+PDF.h"

@implementation UIImageView (ANLoadingAdditions)

- (void)an_updateWithURLString:(NSString*)urlString placeholderName:(NSString*)placeholderName height:(CGFloat)height
{
    UIImage* placeholder = [UIImage imageWithPDFNamed:placeholderName atHeight:height];
    [self an_updateWithURLString:urlString placeholder:placeholder];
}

- (void)an_updateWithURLString:(NSString*)urlString placeholder:(UIImage*)placeholder
{
    NSURL* photoURL;
    if (!ANIsEmpty(urlString))
    {
        photoURL = [NSURL URLWithString:urlString];
    }

    @weakify(self);
    [self sd_setImageWithURL:photoURL
                 placeholderImage:placeholder
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                            
                            if (image)
                            {
                                @strongify(self);
                                [ANAnimator addSimpleTransitionToLayer:self.layer duration:0.1];
                                self.image = [image an_correctScaleImage];
                            }
                        }];
}

@end
