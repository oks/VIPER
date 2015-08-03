//
//  ANCategoriesListVC.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/3/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListVC.h"
#import "ANTableContainerView.h"
#import "ANCategoriesListController.h"

@interface ANCategoriesListVC ()<ANCategoriesListControllerDelegate>

@property (nonatomic, strong) ANTableContainerView* contentView;
@property (nonatomic, strong) ANCategoriesListController* controller;

@end

@implementation ANCategoriesListVC

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.contentView = [ANTableContainerView containerWithTableViewStyle:UITableViewStyleGrouped];
        self.controller = [[ANCategoriesListController alloc] initWithTableView:self.contentView.tableView];
    }
    return self;
}

- (void)loadView
{
    self.view = self.contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"categories-list.screen.title", nil);
    
    @weakify(self);
    [self addRightNavigationButtonWithType:ANBarButtonTypeAdd block:^{
        @strongify(self);
        [self.eventHandler presentAddItemController];
    }];
}


#pragma mark - User Interface

- (void)updateDataSource:(ANCategoriesListDataSource*)dataSource
{
    [self.controller updateDataSource:dataSource];
}

#pragma mark - Controller Delegate

- (void)itemSelected:(ANCategoriesListCellViewModel*)model
{
    [self.eventHandler itemSelected:model];
}

@end
