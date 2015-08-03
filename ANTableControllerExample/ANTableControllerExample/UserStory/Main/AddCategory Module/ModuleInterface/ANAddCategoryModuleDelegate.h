//
//  ANAddCategoryModuleDelegate.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@class ANCategoryDomainModel;

@protocol ANAddCategoryModuleDelegate <NSObject>

- (void)categoryAdded:(ANCategoryDomainModel*)item;

@end
