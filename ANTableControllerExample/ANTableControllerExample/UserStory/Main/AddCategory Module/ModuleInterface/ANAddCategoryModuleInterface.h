//
//  ANAddCategoryModuleInterface.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@protocol ANAddCategoryModuleInterface <NSObject>

- (void)presentImagePicker;
- (void)dismissViewController;
- (void)saveCategoryWithName:(NSString*)categoryName image:(UIImage*)categoryImage;

@end
