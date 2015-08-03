//
//  ANNetworkLoadingViewInterface.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/20/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANNetworkLoadingViewState.h"

@protocol ANNetworkLoadingViewInterface <NSObject>

- (void)updateStateTo:(ANNetworkLoadingState)state;
- (void)retryRequest;

@end
