//
//  ANDebugController.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 2/18/15.
//  Copyright (c) 2015 Oksana Kovalchuk. All rights reserved.
//

#import "ANDebugController.h"
#import "ANBaseListTableCell.h"
#import "ANAddCategoryWireframe.h"

typedef NS_ENUM(NSInteger, ANSections)
{
    ANSectionsAddCategory
};

@implementation ANDebugController

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super initWithTableView:tableView];
    if (self)
    {
        tableView.rowHeight = 55;
        [self registerCellClass:[ANBaseListTableCell class] forModelClass:[NSString class]];
        [self _setupStorage];
    }
    return self;
}

- (void)_setupStorage
{
    [self.memoryStorage addItem:@"Add Category"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row)
    {
        case ANSectionsAddCategory:
        {
            ANAddCategoryWireframe* wireframe = [ANAddCategoryWireframe new];
            [wireframe presentAddCategoryControllerFromNavigationController:self.rootController.navigationController];
        } break;
            
        default: break;
    }
}

@end
