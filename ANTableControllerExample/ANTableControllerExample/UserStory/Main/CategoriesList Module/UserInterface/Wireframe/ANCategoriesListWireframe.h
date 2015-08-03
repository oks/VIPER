//
//  ANCategoriesListWireframe.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@interface ANCategoriesListWireframe : NSObject

- (void)presentCategoriesListControllerFromWindow:(UIWindow*)window;
- (void)presentCategoriesListControllerFromNavigationController:(UINavigationController*)nc;
- (void)dismissCategoriesListController;

- (void)presentAddCategoryController;

@end
