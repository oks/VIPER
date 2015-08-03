//
//  ANAddCategoryPresenter.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryInteractorIO.h"
#import "ANAddCategoryWireframe.h"
#import "ANAddCategoryViewInterface.h"
#import "ANAddCategoryModuleDelegate.h"
#import "ANAddCategoryModuleInterface.h"

@interface ANAddCategoryPresenter : NSObject <ANAddCategoryInteractorOutput, ANAddCategoryModuleInterface>

@property (nonatomic, strong) id<ANAddCategoryInteractorInput> interactor;
@property (nonatomic, strong) ANAddCategoryWireframe* wireframe;

@property (nonatomic, weak) UIViewController<ANAddCategoryViewInterface>* userInterface;
@property (nonatomic, weak) id<ANAddCategoryModuleDelegate> addcategoryModuleDelegate;

- (void)configurePresenterWithUserInterface:(UIViewController<ANAddCategoryViewInterface>*)userInterface;

@end
