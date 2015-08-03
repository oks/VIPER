//
//  ANAddCategoryWireframe.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryWireframe.h"
#import "ANAddCategoryInteractor.h"
#import "ANAddCategoryVC.h"
#import "ANAddCategoryPresenter.h"
#import "ANCameraWireframe.h"

@interface ANAddCategoryWireframe ()

@property (nonatomic, strong) ANAddCategoryPresenter* presenter;
@property (nonatomic, strong) ANAddCategoryVC* addCategoryController;
@property (nonatomic, strong) UINavigationController* presentedController;
@property (nonatomic, strong) ANCameraWireframe* cameraWireframe; // TODO:

@end

@implementation ANAddCategoryWireframe

- (void)presentAddCategoryControllerFromNavigationController:(UINavigationController *)nc
{
    ANAddCategoryVC* addcategoryController = [ANAddCategoryVC new];
    ANAddCategoryInteractor* interactor = [ANAddCategoryInteractor new];
    ANAddCategoryPresenter* presenter = [ANAddCategoryPresenter new];
    
    interactor.output = presenter;
    
    addcategoryController.eventHandler = presenter;
    
    presenter.interactor = interactor;
    presenter.wireframe = self;
    [presenter configurePresenterWithUserInterface:addcategoryController];
    
    ANDispatchBlockToMainQueue(^{
        [nc pushViewController:addcategoryController animated:YES];
    });
    
    self.presenter = presenter;
    self.presentedController = nc;
    self.addCategoryController = addcategoryController;
}

- (void)dismissAddCategoryController
{
    [self.presentedController popViewControllerAnimated:YES];
}

- (void)presentImagePickerControllerWithCompletion:(ANImageCompletionBlock)completion
{
    self.cameraWireframe = [ANCameraWireframe new];
    [self.cameraWireframe presentCameraControllerFromViewController:self.addCategoryController completion:completion];
}

- (void)updateModuleDelegate:(id<ANAddCategoryModuleDelegate>)delegate
{
    self.presenter.addcategoryModuleDelegate = delegate;
}

@end
