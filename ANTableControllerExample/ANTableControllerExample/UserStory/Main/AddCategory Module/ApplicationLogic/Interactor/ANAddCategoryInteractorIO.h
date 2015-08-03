//
//  ANAddCategoryInteractorIO.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@class ANCategoryDomainModel;

@protocol ANAddCategoryInteractorInput <NSObject>

- (void)addCategoryWithName:(NSString*)name imageURLString:(NSString*)imageURLString;

@end


@protocol ANAddCategoryInteractorOutput <NSObject>

- (void)categoryCreatedSuccessful:(ANCategoryDomainModel*)model;
- (void)categoryCreationFailedWithError:(NSError*)error;

@end