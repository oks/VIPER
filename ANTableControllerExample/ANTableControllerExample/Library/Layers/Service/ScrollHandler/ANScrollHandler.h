//
//  SMScrollHandler.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@protocol ANScrollHandlerDelegate <NSObject>
@optional

- (void)newPageScrolledToIndex:(NSInteger)index;
- (void)loadNewItems;

@end

@interface ANScrollHandler : NSObject

@property (nonatomic, weak) id<ANScrollHandlerDelegate> delegate;
@property (nonatomic, assign) NSInteger numberOfPagesToEnd; // default 2
@property (nonatomic, assign) NSInteger currentActivePage;

+ (instancetype)scrollHandlerWithTarget:(id)target;

@end
