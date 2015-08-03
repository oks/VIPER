//
//  ANItemDetailPresenter.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANItemDetailInteractorIO.h"
#import "ANItemDetailWireframe.h"
#import "ANItemDetailViewInterface.h"
#import "ANItemDetailModuleDelegate.h"
#import "ANItemDetailModuleInterface.h"

@interface ANItemDetailPresenter : NSObject <ANItemDetailInteractorOutput, ANItemDetailModuleInterface>

@property (nonatomic, strong) id<ANItemDetailInteractorInput> interactor;
@property (nonatomic, strong) ANItemDetailWireframe* wireframe;

@property (nonatomic, weak) UIViewController<ANItemDetailViewInterface>* userInterface;
@property (nonatomic, weak) id<ANItemDetailModuleDelegate> itemdetailModuleDelegate;

- (void)configurePresenterWithUserInterface:(UIViewController<ANItemDetailViewInterface>*)userInterface;

@end
