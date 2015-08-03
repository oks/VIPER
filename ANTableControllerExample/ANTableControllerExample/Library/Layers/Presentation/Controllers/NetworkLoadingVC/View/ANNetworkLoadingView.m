//
//  ANNetworkLoadingView.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANNetworkLoadingView.h"

@implementation ANNetworkLoadingView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [[self contentViews] enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
            obj.hidden = YES;
            [self addSubview:obj];
        }];
        
        [[self contentViews] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)updateViewWithLoadingState:(ANNetworkLoadingState)state
{
    
}

- (NSArray*)contentViews
{
    return @[self.loadingView, self.retryView, self.noContentView];
}


#pragma mark - Lazy Loading

- (ANNetworkProgressView*)loadingView
{
    if (!_loadingView)
    {
        _loadingView = [ANNetworkProgressView new];
    }
    return _loadingView;
}

- (ANNetworkRetryView*)retryView
{
    if (!_retryView)
    {
        _retryView = [ANNetworkRetryView new];
    }
    return _retryView;
}

- (ANNetworkNoContentView*)noContentView
{
    if (!_noContentView)
    {
        _noContentView = [ANNetworkNoContentView new];
    }
    return _noContentView;
}

@end
