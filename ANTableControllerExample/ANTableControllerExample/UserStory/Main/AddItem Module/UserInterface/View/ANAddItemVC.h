//
//  ANAddItemVC.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/3/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddItemViewInterface.h"
#import "ANAddItemModuleInterface.h"
#import "ANBaseVC.h"

@interface ANAddItemVC : ANBaseVC <ANAddItemViewInterface>

@property (nonatomic, weak) id<ANAddItemModuleInterface> eventHandler;

@end
