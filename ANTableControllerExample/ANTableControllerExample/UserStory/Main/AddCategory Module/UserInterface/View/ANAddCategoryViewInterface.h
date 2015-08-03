//
//  ANAddCategoryViewInterface.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@protocol ANAddCategoryViewInterface <NSObject>

- (void)updateSelectedImage:(UIImage*)image;
- (void)showErrorMessageWithError:(NSError*)error;

@end
