//
//  ANAddCategoryWireframe.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

typedef void(^ANImageCompletionBlock)(UIImage* result);

@protocol ANAddCategoryModuleDelegate;

@interface ANAddCategoryWireframe : NSObject

- (void)presentAddCategoryControllerFromNavigationController:(UINavigationController*)nc;
- (void)dismissAddCategoryController;
- (void)presentImagePickerControllerWithCompletion:(ANImageCompletionBlock)completion;

- (void)updateModuleDelegate:(id<ANAddCategoryModuleDelegate>)delegate;

@end
