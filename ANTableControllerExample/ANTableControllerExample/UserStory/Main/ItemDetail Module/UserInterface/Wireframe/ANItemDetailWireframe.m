//
//  ANItemDetailWireframe.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANItemDetailWireframe.h"
#import "ANItemDetailInteractor.h"
#import "ANItemDetailVC.h"
#import "ANItemDetailPresenter.h"

@interface ANItemDetailWireframe ()

@property (nonatomic, strong) ANItemDetailPresenter* presenter;
@property (nonatomic, strong) ANItemDetailVC* itemdetailController;
@property (nonatomic, strong) UINavigationController* presentedController;

@end

@implementation ANItemDetailWireframe

- (void)presentItemDetailControllerFromNavigationController:(UINavigationController *)nc
{
    ANItemDetailVC* itemdetailController = [ANItemDetailVC new];
    ANItemDetailInteractor* interactor = [ANItemDetailInteractor new];
    ANItemDetailPresenter* presenter = [ANItemDetailPresenter new];
    
    interactor.output = presenter;
    
    itemdetailController.eventHandler = presenter;
    
    presenter.interactor = interactor;
    presenter.wireframe = self;
    [presenter configurePresenterWithUserInterface:itemdetailController];
    
    ANDispatchBlockToMainQueue(^{
        [nc pushViewController:itemdetailController animated:YES];
    });
    
    self.presenter = presenter;
    self.presentedController = nc;
    self.itemdetailController = itemdetailController;
}

- (void)dismissItemDetailController
{
    [self.presentedController popViewControllerAnimated:YES];
}

@end
