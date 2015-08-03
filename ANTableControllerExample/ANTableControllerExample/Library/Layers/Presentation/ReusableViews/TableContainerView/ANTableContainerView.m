//
//  SMTableContainerView.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/13/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANTableContainerView.h"
#import "ANTableView.h"

@implementation ANTableContainerView

+ (instancetype)containerWithTableViewStyle:(UITableViewStyle)style
{
    return [[self alloc] initWithStyle:style];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self)
    {
        ANTableView* tableView = [[ANTableView alloc] initWithFrame:CGRectZero style:style];
        [tableView setupAppearance];
        _tableView = tableView;
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

@end
