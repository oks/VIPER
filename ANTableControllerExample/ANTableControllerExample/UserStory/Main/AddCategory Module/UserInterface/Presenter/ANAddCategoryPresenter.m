//
//  ANAddCategoryPresenter.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryPresenter.h"
#import "ANImageCache.h"

@interface ANAddCategoryPresenter ()

@end

@implementation ANAddCategoryPresenter

- (void)configurePresenterWithUserInterface:(UIViewController<ANAddCategoryViewInterface>*)userInterface
{
    self.userInterface = userInterface;
}


#pragma mark - Output

- (void)categoryCreationFailedWithError:(NSError*)error
{
    [self.userInterface showErrorMessageWithError:error];
}

- (void)categoryCreatedSuccessful:(ANCategoryDomainModel*)model
{
    [self.addcategoryModuleDelegate categoryAdded:model];
    [self.wireframe dismissAddCategoryController];
}


#pragma mark - Module Interface

- (void)presentImagePicker
{
    [self.wireframe presentImagePickerControllerWithCompletion:^(UIImage *result) {
        [self.userInterface updateSelectedImage:result];
    }];
}

- (void)dismissViewController
{
    [self.wireframe dismissAddCategoryController];
}

- (void)saveCategoryWithName:(NSString*)categoryName image:(UIImage*)categoryImage
{
    NSString* key = [ANImageCache saveImage:categoryImage];
    [self.interactor addCategoryWithName:categoryName imageURLString:key];
}

@end
