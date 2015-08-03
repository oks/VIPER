//
//  ANItemDetailVC.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/3/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANItemDetailViewInterface.h"
#import "ANItemDetailModuleInterface.h"
#import "ANBaseVC.h"

@interface ANItemDetailVC : ANBaseVC <ANItemDetailViewInterface>

@property (nonatomic, weak) id<ANItemDetailModuleInterface> eventHandler;

@end
