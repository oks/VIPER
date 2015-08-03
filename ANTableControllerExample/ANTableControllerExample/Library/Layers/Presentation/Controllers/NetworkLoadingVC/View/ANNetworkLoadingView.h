//
//  ANNetworkLoadingView.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANActivityIndicator.h"
#import "ANNetworkNoContentView.h"
#import "ANNetworkProgressView.h"
#import "ANNetworkRetryView.h"
#import "ANNetworkLoadingViewState.h"

@interface ANNetworkLoadingView : UIView

@property (nonatomic, strong) ANNetworkProgressView *loadingView;
@property (nonatomic, strong) ANNetworkRetryView *retryView;
@property (nonatomic, strong) ANNetworkNoContentView *noContentView;

- (void)updateViewWithLoadingState:(ANNetworkLoadingState)state;
- (NSArray*)contentViews;

@end
