//
//  ANCategoriesListPresenter.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListPresenter.h"
#import "ANCategoriesListDataSource.h"

@interface ANCategoriesListPresenter ()

@property (nonatomic, strong) ANCategoriesListDataSource* dataSource;

@end

@implementation ANCategoriesListPresenter

- (void)configurePresenterWithUserInterface:(UIViewController<ANCategoriesListViewInterface>*)userInterface
{
    self.userInterface = userInterface;
    self.dataSource = [ANCategoriesListDataSource new];
    [self.userInterface updateDataSource:self.dataSource];
    
    [self.interactor loadCategoriesList];
}


#pragma mark - Output

- (void)categoriesListLoaded:(NSArray*)categories
{
    [self.dataSource setupStorageWithItems:categories];
}

- (void)categoryRemovedSuccessfully:(ANCategoryDomainModel *)category
{
    [self.dataSource removeCategoryWithModel:category];
}



#pragma mark - Module Interface

- (void)itemSelected:(ANCategoriesListCellViewModel*)item
{
//    [self.wireframe itemSelected:] // TODO:
}

- (void)presentAddItemController
{
    [self.wireframe presentAddCategoryController];
}

#pragma mark - Add Category Module Delegate

- (void)categoryAdded:(ANCategoryDomainModel *)item
{
    [self.interactor addCategory:item];
}

@end
