//
//  ANCategoriesListWireframe.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListWireframe.h"
#import "ANCategoriesListInteractor.h"
#import "ANCategoriesListVC.h"
#import "ANCategoriesListPresenter.h"
#import "ANAddCategoryWireframe.h"


@interface ANCategoriesListWireframe ()

@property (nonatomic, strong) ANCategoriesListPresenter* presenter;
@property (nonatomic, strong) ANCategoriesListVC* categorieslistController;
@property (nonatomic, strong) UINavigationController* presentedController;

@end

@implementation ANCategoriesListWireframe

- (void)presentCategoriesListControllerFromWindow:(UIWindow*)window
{
    UINavigationController* nc = [UINavigationController new];
    window.rootViewController = nc;
    [self presentCategoriesListControllerFromNavigationController:nc];
}

- (void)presentCategoriesListControllerFromNavigationController:(UINavigationController*)nc
{
    ANCategoriesListVC* categorieslistController = [ANCategoriesListVC new];
    ANCategoriesListInteractor* interactor = [ANCategoriesListInteractor new];
    ANCategoriesListPresenter* presenter = [ANCategoriesListPresenter new];
    
    interactor.output = presenter;
    
    categorieslistController.eventHandler = presenter;
    
    presenter.interactor = interactor;
    presenter.wireframe = self;
    [presenter configurePresenterWithUserInterface:categorieslistController];
    
    ANDispatchBlockToMainQueue(^{
        [nc pushViewController:categorieslistController animated:YES];
    });
    
    self.presenter = presenter;
    self.presentedController = nc;
    self.categorieslistController = categorieslistController;
}

- (void)dismissCategoriesListController
{
    [self.presentedController popViewControllerAnimated:YES];
}


#pragma mark - Additional

- (void)presentAddCategoryController
{
    ANAddCategoryWireframe* wireframe = [ANAddCategoryWireframe new];
    [wireframe presentAddCategoryControllerFromNavigationController:self.presentedController];
    [wireframe updateModuleDelegate:self.presenter];
}

@end
