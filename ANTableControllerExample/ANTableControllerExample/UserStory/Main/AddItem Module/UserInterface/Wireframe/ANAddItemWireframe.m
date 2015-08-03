//
//  ANAddItemWireframe.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddItemWireframe.h"
#import "ANAddItemInteractor.h"
#import "ANAddItemVC.h"
#import "ANAddItemPresenter.h"

@interface ANAddItemWireframe ()

@property (nonatomic, strong) ANAddItemPresenter* presenter;
@property (nonatomic, strong) ANAddItemVC* additemController;
@property (nonatomic, strong) UINavigationController* presentedController;

@end

@implementation ANAddItemWireframe

- (void)presentAddItemControllerFromNavigationController:(UINavigationController *)nc
{
    ANAddItemVC* additemController = [ANAddItemVC new];
    ANAddItemInteractor* interactor = [ANAddItemInteractor new];
    ANAddItemPresenter* presenter = [ANAddItemPresenter new];
    
    interactor.output = presenter;
    
    additemController.eventHandler = presenter;
    
    presenter.interactor = interactor;
    presenter.wireframe = self;
    [presenter configurePresenterWithUserInterface:additemController];
    
    ANDispatchBlockToMainQueue(^{
        [nc pushViewController:additemController animated:YES];
    });
    
    self.presenter = presenter;
    self.presentedController = nc;
    self.additemController = additemController;
}

- (void)dismissAddItemController
{
    [self.presentedController popViewControllerAnimated:YES];
}

@end
