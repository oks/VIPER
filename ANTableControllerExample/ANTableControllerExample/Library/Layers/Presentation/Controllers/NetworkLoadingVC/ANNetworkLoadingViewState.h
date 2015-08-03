//
//  ANNetworkLoadingViewState.h
//  ANTableControllerExample
//
//  Created by Oleg Panforov on 6/20/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

typedef NS_ENUM(NSInteger, ANNetworkLoadingState)
{
    ANNetworkLoadingStateNone = -1,
    ANNetworkLoadingStateLoading = 0,
    ANNetworkLoadingStateRetry = 1,
    ANNetworkLoadingStateNoContent = 2
};
