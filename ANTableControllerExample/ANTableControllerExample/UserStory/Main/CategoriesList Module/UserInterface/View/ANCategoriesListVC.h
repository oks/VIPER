//
//  ANCategoriesListVC.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/3/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListViewInterface.h"
#import "ANCategoriesListModuleInterface.h"
#import "ANBaseVC.h"

@interface ANCategoriesListVC : ANBaseVC <ANCategoriesListViewInterface>

@property (nonatomic, weak) id<ANCategoriesListModuleInterface> eventHandler;

@end
