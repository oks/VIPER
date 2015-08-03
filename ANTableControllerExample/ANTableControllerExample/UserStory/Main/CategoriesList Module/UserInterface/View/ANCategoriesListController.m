//
//  ANCategoriesListController.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListController.h"
#import "ANCategoriesListDataSource.h"

@implementation ANCategoriesListController

- (instancetype)initWithTableView:(UITableView*)tableView
{
    self = [super initWithTableView:tableView];
    if (self)
    {
        [self registerCellClass:[ANCategoriesListCell class] forModelClass:[ANCategoriesListCellViewModel class]];
        tableView.rowHeight = 50;
    }
    return self;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    id model = [self.storage objectAtIndexPath:indexPath];
    [self.delegate itemSelected:model];
}

- (void)updateDataSource:(ANCategoriesListDataSource*)dataSource
{
    self.storage = dataSource.storage;
}

@end
