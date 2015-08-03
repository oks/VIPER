//
//  ANCategoriesListDataSource.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListCell.h"

@class ANMemoryStorage;

@interface ANCategoriesListDataSource : NSObject

@property (nonatomic, strong) ANMemoryStorage* storage;

- (void)setupStorageWithItems:(NSArray*)items;
- (void)removeCategoryWithModel:(ANCategoryDomainModel*)model;

@end
