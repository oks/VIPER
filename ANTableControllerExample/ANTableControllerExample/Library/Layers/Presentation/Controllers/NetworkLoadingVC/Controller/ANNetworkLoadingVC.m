//
//  ANNetworkLoadingVC.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANNetworkLoadingVC.h"
#import "ANNetworkLoadingView.h"

@interface ANNetworkLoadingVC ()

@property (nonatomic, strong) ANNetworkLoadingView* loadingView;

@end

@implementation ANNetworkLoadingVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.loadingView];
    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self updateStateTo:ANNetworkLoadingStateLoading];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.loadingView.loadingView.progressView startAnimating];
}

- (void)updateStateTo:(ANNetworkLoadingState)state
{
    if (state == ANNetworkLoadingStateNone)
    {
        self.loadingView.hidden = YES;
    }
    else
    {
        self.loadingView.hidden = NO;
    }
    [[self.loadingView contentViews] enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
        
        BOOL isVisible = (idx != state);
        obj.hidden = isVisible;
        if (isVisible)
        {
            [self.view bringSubviewToFront:obj];
        }
    }];
}

- (void)retryRequest
{
    [self updateStateTo:ANNetworkLoadingStateLoading];
}

- (ANNetworkLoadingView*)loadingView
{
    if (!_loadingView)
    {
        _loadingView = [ANNetworkLoadingView new];
    }
    return _loadingView;
}

@end
