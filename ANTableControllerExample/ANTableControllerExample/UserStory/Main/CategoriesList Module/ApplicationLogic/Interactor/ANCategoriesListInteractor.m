//
//  ANCategoriesListInteractor.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListInteractor.h"
#import "ANCategoryDomainModel.h"

@interface ANCategoriesListInteractor ()

@property (nonatomic, strong) NSArray* categories;

@end

@implementation ANCategoriesListInteractor

- (void)loadCategoriesList
{
    self.categories = [self _generateCategories];
    [self.output categoriesListLoaded:self.categories];
}

- (void)removeCategory:(ANCategoryDomainModel *)model
{
    NSMutableArray* categories = [self.categories mutableCopy];
    [categories removeObject:model];
    self.categories = [categories copy];
}

- (void)addCategory:(ANCategoryDomainModel *)model
{
    if (!ANIsEmpty(model))
    {
        self.categories = [self.categories arrayByAddingObject:model];
        [self.output categoriesListLoaded:self.categories];
    }
}


#pragma mark - Private 

- (NSArray*)_generateCategories
{
    ANCategoryDomainModel* redWine = [ANCategoryDomainModel categoryWithName:@"Red Wine" imageURLString:@""];
    ANCategoryDomainModel* whiteWine = [ANCategoryDomainModel categoryWithName:@"White Wine" imageURLString:@""];
    ANCategoryDomainModel* blueWine = [ANCategoryDomainModel categoryWithName:@"Blue Wine" imageURLString:@""];
    ANCategoryDomainModel* greenWine = [ANCategoryDomainModel categoryWithName:@"Green Wine" imageURLString:@""];
    ANCategoryDomainModel* yellowWine = [ANCategoryDomainModel categoryWithName:@"Yellow Wine" imageURLString:@""];
    
    return @[redWine, whiteWine, blueWine, greenWine, yellowWine];
}

@end
