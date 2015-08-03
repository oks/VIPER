//
//  ANAddItemInteractor.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddItemInteractorIO.h"

@interface ANAddItemInteractor : NSObject <ANAddItemInteractorInput>

@property (nonatomic, weak) id<ANAddItemInteractorOutput> output;

@end

