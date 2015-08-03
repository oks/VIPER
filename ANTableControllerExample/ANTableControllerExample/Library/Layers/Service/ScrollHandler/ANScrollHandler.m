//
//  SMScrollHandler.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANScrollHandler.h"
#import "FBKVOController.h"
#import "FrameAccessor.h"

static NSString* const kContentOffsetKey = @"contentOffset";

@interface ANScrollHandler () {
    struct {
        BOOL shouldLoadMoreItems : YES;
        BOOL didPageUpdate : YES;
    } _delegateExistingMethods;
}

@property (nonatomic, assign) NSInteger activePage;
@property (nonatomic, weak) UIScrollView* target;

@end

@implementation ANScrollHandler

+ (instancetype)scrollHandlerWithTarget:(id)target
{
    if (![target isKindOfClass:[UIScrollView class]])
    {
        ANLogWarning(@"You trying to observe non-scroll instance");
        return nil;
    }
    ANScrollHandler* instance = [self new];
    instance.target = target;
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _numberOfPagesToEnd = 2;
    }
    return self;
}

- (void)setDelegate:(id<ANScrollHandlerDelegate>)delegate
{
    _delegate = delegate;
    if ([_delegate respondsToSelector:@selector(loadNewItems)])
    {
        _delegateExistingMethods.shouldLoadMoreItems = YES;
    }
    if ([_delegate respondsToSelector:@selector(newPageScrolledToIndex:)])
    {
        _delegateExistingMethods.didPageUpdate = YES;
    }
}

- (void)setTarget:(UIScrollView *)target
{
    _target = target;
    [self _setupObservingWithTarget:_target];
}

- (CGFloat)_pageDimension
{
    return [self _isVerticalScrolling] ? self.target.height : self.target.width;
}

- (CGFloat)_pageContentDimension
{
    return [self _isVerticalScrolling] ? self.target.contentSizeHeight : self.target.contentSizeWidth;
}

- (void)setCurrentActivePage:(NSInteger)currentActivePage
{
    CGFloat newOffsetDimestion = [self _pageDimension] * currentActivePage;
    if ([self _pageContentDimension] >= newOffsetDimestion)
    {
        CGFloat newX = [self _isVerticalScrolling] ? self.target.contentOffsetX : newOffsetDimestion;
        CGFloat newY = [self _isVerticalScrolling] ? newOffsetDimestion : self.target.contentOffsetY;
        
        CGPoint newOffset = CGPointMake(newX, newY);
        
        [self.target setContentOffset:newOffset animated:NO];
        self.activePage = currentActivePage;
    }
}

- (NSInteger)currentActivePage
{
    return self.activePage;
}

#pragma mark - Private

- (void)_setupObservingWithTarget:(UIScrollView*)target
{
    [self.KVOController observe:target
                        keyPath:kContentOffsetKey
                        options:NSKeyValueObservingOptionNew block:^(id observer, NSValue* contentSize, NSDictionary *change) {
                            
                            CGPoint newOffset = [change[NSKeyValueChangeNewKey] CGPointValue];
                            [self _contentOffsetUpdatedTo:newOffset];
                            
                            BOOL shouldLoadNew = [self _shouldLoadItemsForNewContentOffset:newOffset];
                            if (shouldLoadNew && _delegateExistingMethods.shouldLoadMoreItems)
                            {
                                [self.delegate loadNewItems];
                            }
                        }];
}

- (void)_notifyForNewPage:(NSInteger)page
{
    if ((page >= 0) && _delegateExistingMethods.didPageUpdate)
    {
        [self.delegate newPageScrolledToIndex:page];
    }
}

- (BOOL)_shouldLoadItemsForNewContentOffset:(CGPoint)newOffset
{
    CGSize size = self.target.bounds.size;
    CGSize contentSize = self.target.contentSize;
    CGFloat pageDimension = 0;
    CGFloat contentSizeDimesion = 0;
    CGFloat newOffsetDimension = 0;
    
    if ((contentSize.height - size.height) > (contentSize.width - size.width))
    {
        pageDimension = size.height;
        contentSizeDimesion = contentSize.height;
        newOffsetDimension = newOffset.y;
    }
    else
    {
        pageDimension = size.width;
        contentSizeDimesion = contentSize.width;
        newOffsetDimension = newOffset.x;
    }
    
    CGFloat maxContentOffset = contentSizeDimesion - pageDimension;
    CGFloat triggeringContentOffset = maxContentOffset - pageDimension * self.numberOfPagesToEnd;
    return (newOffsetDimension >= triggeringContentOffset);
}

- (void)_contentOffsetUpdatedTo:(CGPoint)newOffset
{
    //calculate new visible image
    CGFloat offsetDimension = [self _isVerticalScrolling] ? newOffset.y : newOffset.x;
    CGFloat dimension = [self _isVerticalScrolling] ? self.target.bounds.size.height : self.target.bounds.size.width;
    CGFloat halfWidth = dimension / 2;
    CGFloat scrollDelta = offsetDimension - self.activePage * dimension;
    
    if (fabs(scrollDelta) > dimension)
    {
        self.activePage = offsetDimension / dimension;
        scrollDelta = offsetDimension - self.activePage * dimension;
    }
    
    NSInteger page = 0;
    if (scrollDelta > halfWidth)
    {
        page = self.activePage + 1;
        [self _notifyForNewPage:page];
    }
    else
    {
        if (scrollDelta < -halfWidth)
        {
            page = self.activePage - 1;
            [self _notifyForNewPage:page];
        }
        else
        {
            page = self.activePage;
            [self _notifyForNewPage:page];
        }
    }
    
    if (scrollDelta == 0)
    {
        self.activePage = offsetDimension / dimension;
    }
}

- (BOOL)_isVerticalScrolling
{
    CGFloat heightDelta = self.target.contentSize.height - self.target.frame.size.height;
    CGFloat widthDelta = self.target.contentSize.width - self.target.frame.size.width;
    return (heightDelta > widthDelta);
}

@end
