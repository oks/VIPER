//
//  ANCategoriesListDataSource.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListDataSource.h"
#import "ANMemoryStorage.h"

@interface ANCategoriesListDataSource ()

@end

@implementation ANCategoriesListDataSource

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.storage = [ANMemoryStorage storage];
    }
    return self;
}

- (void)setupStorageWithItems:(NSArray *)items
{
    if (!ANIsEmpty(items))
    {
        items = [[items.rac_sequence map:^id(id value) {
           
            return [ANCategoriesListCellViewModel viewModelWithItem:value];
        }] array];
        
        [self.storage removeAllItems];
        [self.storage addItems:items];
    }
}

- (void)removeCategoryWithModel:(ANCategoryDomainModel *)model
{
//    ANCategoriesListCellViewModel* viewModel;
    
    //TODO: filter all 
}

@end
