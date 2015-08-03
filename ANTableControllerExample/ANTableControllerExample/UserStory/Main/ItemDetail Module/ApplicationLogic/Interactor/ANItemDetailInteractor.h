//
//  ANItemDetailInteractor.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANItemDetailInteractorIO.h"

@interface ANItemDetailInteractor : NSObject <ANItemDetailInteractorInput>

@property (nonatomic, weak) id<ANItemDetailInteractorOutput> output;

@end

