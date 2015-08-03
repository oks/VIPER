//
//  ANCategoriesListCellViewModel.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@class ANCategoryDomainModel;

@interface ANCategoriesListCellViewModel : NSObject

+ (instancetype)viewModelWithItem:(ANCategoryDomainModel*)categoryModel;

- (NSString*)titleString;
- (void)updateImageView:(UIImageView*)imageView;

@end
