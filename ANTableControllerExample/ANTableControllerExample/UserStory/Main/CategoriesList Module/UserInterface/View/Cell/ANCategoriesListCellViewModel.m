//
//  ANCategoriesListCellViewModel.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListCellViewModel.h"
#import "NSObject+ANSafeValues.h"
#import "ANCategoryDomainModel.h"
#import "UIImageView+ANLoadingAdditions.h"

@interface ANCategoriesListCellViewModel ()

@property (nonatomic, strong) ANCategoryDomainModel* item;

@end

@implementation ANCategoriesListCellViewModel

+ (instancetype)viewModelWithItem:(ANCategoryDomainModel *)categoryModel
{
    ANCategoriesListCellViewModel* viewModel = [self new];
    viewModel.item = categoryModel;
    return viewModel;
}

- (NSString *)titleString
{
    return [NSObject an_safeString:self.item.name];
}

- (void)updateImageView:(UIImageView *)imageView
{
    [imageView an_updateWithURLString:self.item.imageURLString placeholder:nil]; // TODO:
}

@end
