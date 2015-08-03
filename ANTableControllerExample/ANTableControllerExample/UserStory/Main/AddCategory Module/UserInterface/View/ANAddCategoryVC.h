//
//  ANAddCategoryVC.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/3/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryViewInterface.h"
#import "ANAddCategoryModuleInterface.h"
#import "ANBaseVC.h"

@interface ANAddCategoryVC : ANBaseVC <ANAddCategoryViewInterface>

@property (nonatomic, weak) id<ANAddCategoryModuleInterface> eventHandler;

@end
