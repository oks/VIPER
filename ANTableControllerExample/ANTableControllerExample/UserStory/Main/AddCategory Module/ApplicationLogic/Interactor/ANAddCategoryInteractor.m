//
//  ANAddCategoryInteractor.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryInteractor.h"
#import "ANCategoryDomainModel.h"

@implementation ANAddCategoryInteractor

- (void)addCategoryWithName:(NSString*)name imageURLString:(NSString *)imageURLString
{
    ANCategoryDomainModel* model = [ANCategoryDomainModel categoryWithName:name imageURLString:imageURLString];
    
    NSError* validationError;
    if ([self _validateCategory:model error:&validationError])
    {
        [self.output categoryCreatedSuccessful:model];
    }
    else
    {
        [self.output categoryCreationFailedWithError:validationError];
    }
}


#pragma mark - Private

- (BOOL)_validateCategory:(ANCategoryDomainModel*)model error:(NSError**)error
{
    if (ANIsEmpty(model.name))
    {
        *error = [NSError errorWithDomain:@"mobi.anoda.tablecontroller" code:2 userInfo:@{}]; //TODO: error builder
        return NO;
    }
    return YES;
}

@end
