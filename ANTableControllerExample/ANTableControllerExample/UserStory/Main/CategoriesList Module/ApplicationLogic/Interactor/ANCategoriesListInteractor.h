//
//  ANCategoriesListInteractor.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListInteractorIO.h"

@interface ANCategoriesListInteractor : NSObject <ANCategoriesListInteractorInput>

@property (nonatomic, weak) id<ANCategoriesListInteractorOutput> output;

@end

