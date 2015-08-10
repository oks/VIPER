//
//  ANAddCategoryModuleTestSpec.m
//  ANTableControllerExample
//
//  Created by Dmitriy Frolow on 09/08/15.
//  Copyright 2015 ANODA. All rights reserved.
//

#import "Specta.h"
#import <Expecta.h>
#import "ANAddCategoryPresenter.h"
#import "ANAddCategoryVC.h"
#import "ANAddCategoryInteractor.h"
#import "ANAddItemWireframe.h"
#import "ANCategoriesListPresenter.h"
#import "ANCategoriesListDataSource.h"
#import "ANMemoryStorage.h"
#import "ANSectionModel.h"
#import "ANCategoriesListVC.h"
#import "ANCategoriesListInteractor.h"
#import "ANCategoriesListWireframe.h"
#import "ANCameraWireframe.h"



SpecBegin(ANAddCategoryModuleTest)

describe(@"ANAddCategoryModuleTest", ^{
    __block ANAddCategoryPresenter* presenter;
    __block ANAddCategoryVC* categoryVC;
    __block ANAddCategoryInteractor* interactor;
    __block ANAddCategoryWireframe* wireframe;
    
    __block ANCategoriesListPresenter* categoryListPresenter;
    __block ANCategoriesListVC* categoriesListVC;
    __block ANCategoriesListInteractor* categoriesListInteractor;
    __block ANCategoriesListWireframe* categoriesListWireframe;
    
    
    
    
    beforeAll(^{
        presenter = [ANAddCategoryPresenter new];
        categoryVC = [ANAddCategoryVC new];
        interactor = [ANAddCategoryInteractor new];
        wireframe = [ANAddCategoryWireframe new];
        presenter.userInterface = categoryVC;
        presenter.interactor = interactor;
        interactor.output = presenter;
        categoryVC.eventHandler = presenter;
        presenter.wireframe = wireframe;
        
        categoryListPresenter = [ANCategoriesListPresenter new];
        categoriesListVC = [ANCategoriesListVC new];
        categoriesListInteractor = [ANCategoriesListInteractor new];
        categoriesListWireframe = [ANCategoriesListWireframe new];
        categoryListPresenter.interactor = categoriesListInteractor;
        categoriesListVC.eventHandler = categoryListPresenter;
        categoriesListInteractor.output = categoryListPresenter;
        categoryListPresenter.wireframe = categoriesListWireframe;
        [categoryListPresenter configurePresenterWithUserInterface:categoriesListVC];
        
        presenter.addcategoryModuleDelegate = categoryListPresenter;
        
    });
    
    describe(@"Create and save categroy test", ^{
        
        it(@"save model test", ^{
            
            ANCategoriesListDataSource* listDataSource = [categoryListPresenter valueForKey:@"dataSource"];
            
            ANSectionModel* firstSection =
            [listDataSource.storage.sections firstObject];
            
            NSInteger initialObjectCount = [firstSection.objects count];
            [presenter saveCategoryWithName:@"testName" image:nil];
            
            ANSectionModel* sectionAfterUpdate =
            [listDataSource.storage.sections firstObject]; // get new section, couse after update section and data was removed
            NSInteger objectsAfterSaveModel = [sectionAfterUpdate.objects count];
            expect(objectsAfterSaveModel).to.equal(initialObjectCount+1);
            
        });
    });
    
    beforeEach(^{

    });
    
    it(@"", ^{

    });  
    
    afterEach(^{

    });
    
    afterAll(^{

    });
});


SpecEnd
