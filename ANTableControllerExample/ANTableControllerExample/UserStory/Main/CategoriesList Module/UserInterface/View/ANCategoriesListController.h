//
//  ANCategoriesListController.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANTableController.h"

@class ANCategoriesListCellViewModel;
@class ANCategoriesListDataSource;

@protocol ANCategoriesListControllerDelegate <NSObject>

- (void)itemSelected:(ANCategoriesListCellViewModel*)model;

@end

@interface ANCategoriesListController : ANTableController

@property (nonatomic, weak) id<ANCategoriesListControllerDelegate> delegate;

- (void)updateDataSource:(ANCategoriesListDataSource *)dataSource;

@end
