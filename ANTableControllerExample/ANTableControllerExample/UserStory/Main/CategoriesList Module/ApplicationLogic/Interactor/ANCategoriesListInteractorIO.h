//
//  ANCategoriesListInteractorIO.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@class ANCategoryDomainModel;

@protocol ANCategoriesListInteractorInput <NSObject>

- (void)loadCategoriesList;
- (void)removeCategory:(ANCategoryDomainModel*)model;
- (void)addCategory:(ANCategoryDomainModel*)model;

@end


@protocol ANCategoriesListInteractorOutput <NSObject>

- (void)categoriesListLoaded:(NSArray*)categories;
- (void)categoryRemovedSuccessfully:(ANCategoryDomainModel*)category;

@end