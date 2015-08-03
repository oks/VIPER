//
//  ANAddItemPresenter.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddItemInteractorIO.h"
#import "ANAddItemWireframe.h"
#import "ANAddItemViewInterface.h"
#import "ANAddItemModuleDelegate.h"
#import "ANAddItemModuleInterface.h"

@interface ANAddItemPresenter : NSObject <ANAddItemInteractorOutput, ANAddItemModuleInterface>

@property (nonatomic, strong) id<ANAddItemInteractorInput> interactor;
@property (nonatomic, strong) ANAddItemWireframe* wireframe;

@property (nonatomic, weak) UIViewController<ANAddItemViewInterface>* userInterface;
@property (nonatomic, weak) id<ANAddItemModuleDelegate> additemModuleDelegate;

- (void)configurePresenterWithUserInterface:(UIViewController<ANAddItemViewInterface>*)userInterface;

@end
