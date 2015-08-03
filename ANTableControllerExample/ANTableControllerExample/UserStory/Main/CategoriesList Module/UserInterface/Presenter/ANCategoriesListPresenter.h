//
//  ANCategoriesListPresenter.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListInteractorIO.h"
#import "ANCategoriesListWireframe.h"
#import "ANCategoriesListViewInterface.h"
#import "ANCategoriesListModuleDelegate.h"
#import "ANCategoriesListModuleInterface.h"
#import "ANAddCategoryModuleDelegate.h"

@interface ANCategoriesListPresenter : NSObject
<
    ANCategoriesListInteractorOutput,
    ANCategoriesListModuleInterface,
    ANAddCategoryModuleDelegate
>

@property (nonatomic, strong) id<ANCategoriesListInteractorInput> interactor;
@property (nonatomic, strong) ANCategoriesListWireframe* wireframe;

@property (nonatomic, weak) UIViewController<ANCategoriesListViewInterface>* userInterface;
@property (nonatomic, weak) id<ANCategoriesListModuleDelegate> categorieslistModuleDelegate;

- (void)configurePresenterWithUserInterface:(UIViewController<ANCategoriesListViewInterface>*)userInterface;

@end
