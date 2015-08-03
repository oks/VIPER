//
//  ANDebugVC.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 2/18/15.
//  Copyright (c) 2015 Oksana Kovalchuk. All rights reserved.
//

#import "ANDebugVC.h"
#import "ANDebugController.h"
#import "ANTableContainerView.h"

@interface ANDebugVC ()

@property (nonatomic, strong) ANDebugController* controller;
@property (nonatomic, strong) ANTableContainerView* debugView;

@end

@implementation ANDebugVC

- (void)loadView
{
    self.view = self.debugView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"debug.screen.title", nil);
    
    self.controller = [[ANDebugController alloc] initWithTableView:self.debugView.tableView];
    self.controller.rootController = self;
}


#pragma mark - Lazy Load

- (ANTableContainerView *)debugView
{
    if (!_debugView)
    {
        _debugView = [ANTableContainerView containerWithTableViewStyle:UITableViewStylePlain];
    }
    return _debugView;
}

@end
