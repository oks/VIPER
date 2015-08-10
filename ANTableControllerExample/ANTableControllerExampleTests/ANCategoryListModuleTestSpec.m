//
//  ANCategoryListModuleTestSpec.m
//  ANTableControllerExample
//
//  Created by Dmitriy Frolow on 09/08/15.
//  Copyright 2015 ANODA. All rights reserved.
//

#import "Specta.h"
#import <Expecta.h>
#import "ANCategoriesListPresenter.h"
#import "ANCategoriesListInteractor.h"
#import "ANCategoriesListVC.h"
#import "ANTableContainerView.h"
#import "ANCategoryDomainModel.h"
#import "ANCategoriesListDataSource.h"
#import "ANMemoryStorage.h"
#import "ANSectionModel.h"
#import "ANCategoriesListController.h"
#import "ANTableController.h"

SpecBegin(ANCategoryListModuleTest)

describe(@"ANCategoryListModuleTest", ^{
        __block ANCategoriesListPresenter* presenter;
        __block ANCategoriesListInteractor* interactor;
        __block ANCategoriesListVC* categoriesVC;
        
        beforeAll(^{
            presenter = [ANCategoriesListPresenter new];
            interactor = [ANCategoriesListInteractor new];
            categoriesVC = [ANCategoriesListVC new];
            [categoriesVC view];
            interactor.output = presenter;
            categoriesVC.eventHandler = presenter;
            presenter.interactor = interactor;
            [presenter configurePresenterWithUserInterface:categoriesVC];
            
        });
    
#pragma mark - Module with ANTableController tests
    
        describe(@"add nil as model", ^{
            it(@"add nil as model", ^{
                ANTableContainerView* tableContaingerView = (ANTableContainerView* )categoriesVC.view;
                UITableView* testedTableView = tableContaingerView.tableView;
                NSInteger initialRowsCount = [testedTableView numberOfRowsInSection:0];
                [presenter categoryAdded:nil];
                NSInteger rowsCountAfterAddNilAsModel = [testedTableView numberOfRowsInSection:0];
                expect(initialRowsCount).to.equal(rowsCountAfterAddNilAsModel);
            });
        });
    
        describe(@"Add model to storage", ^{
            it(@"add item to storage", ^{
                ANTableContainerView* tableContaingerView = (ANTableContainerView* )categoriesVC.view;
                UITableView* testedTableView = tableContaingerView.tableView;
                NSInteger initialRowsCount = [testedTableView numberOfRowsInSection:0];
                
                ANCategoryDomainModel* categoryModel =
                [ANCategoryDomainModel categoryWithName:@"tested category" imageURLString:nil];
                
                [presenter categoryAdded:categoryModel];
                
                NSInteger rowsCountAfterAddModel = [testedTableView numberOfRowsInSection:0];
                expect(initialRowsCount + 1).equal(rowsCountAfterAddModel);
            });
        });
        
    
#pragma mark - ANStorage tests
    
        describe(@"remove all items,all secction should removed", ^{
            it(@"remove all items", ^{
                ANCategoriesListDataSource* dataSource = [presenter valueForKey:@"dataSource"];
                
                [dataSource.storage removeAllItems];
                expect(dataSource.storage.sections).haveCount(0);
            });
        });
        
        describe(@"section creation test", ^{
            it(@"add item to first section should create two sections", ^{
                
                ANCategoryDomainModel* categoryModel =
                [ANCategoryDomainModel categoryWithName:@"tested category" imageURLString:nil];
                
                ANCategoriesListDataSource* dataSource = [presenter valueForKey:@"dataSource"];
                [dataSource.storage addItem:categoryModel toSection:1];
                expect(dataSource.storage.sections).haveCount(2); // after add model to section 1 should create 0 and 1 section in sum = 2
            });
        });
        
        describe(@"remove section test", ^{
            it(@"remove section test", ^{
                ANCategoriesListDataSource* dataSource = [presenter valueForKey:@"dataSource"];
                
                NSInteger beforeRemoveSectionCount = dataSource.storage.sections.count;
                [dataSource.storage removeSections:[NSIndexSet indexSetWithIndex:1]];
                expect(dataSource.storage.sections).haveCount(beforeRemoveSectionCount - 1);
            });
        });
    
        describe(@"get existing section with index", ^{
            it(@"get section with index", ^{
                ANCategoriesListController* tableController = [categoriesVC valueForKey:@"controller"];
                ANSectionModel* section = [tableController.memoryStorage sectionAtIndex:0];
                expect(section).notTo.beNil();
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
