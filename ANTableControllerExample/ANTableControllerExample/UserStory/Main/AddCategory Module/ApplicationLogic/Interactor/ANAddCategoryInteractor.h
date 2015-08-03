//
//  ANAddCategoryInteractor.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryInteractorIO.h"

@interface ANAddCategoryInteractor : NSObject <ANAddCategoryInteractorInput>

@property (nonatomic, weak) id<ANAddCategoryInteractorOutput> output;

@end

