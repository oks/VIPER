//
//  ANCategoriesListModuleInterface.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@class ANCategoriesListCellViewModel;

@protocol ANCategoriesListModuleInterface <NSObject>

- (void)itemSelected:(ANCategoriesListCellViewModel*)item;
- (void)presentAddItemController;

@end
