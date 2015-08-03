//
//  ANNetworkLoadingVC.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANBaseVC.h"
#import "ANNetworkLoadingViewInterface.h"

@interface ANNetworkLoadingVC : ANBaseVC <ANNetworkLoadingViewInterface>

- (void)updateStateTo:(ANNetworkLoadingState)state;
- (void)retryRequest NS_REQUIRES_SUPER;

@end
