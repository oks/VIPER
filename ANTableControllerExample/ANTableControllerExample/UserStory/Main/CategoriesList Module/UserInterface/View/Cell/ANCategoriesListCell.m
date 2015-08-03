//
//  ANCategoriesListCell.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCategoriesListCell.h"

@implementation ANCategoriesListCell

- (void)updateWithModel:(ANCategoriesListCellViewModel*)model
{
    self.titleLabel.text = model.titleString;
    [model updateImageView:self.iconImageView];
}

@end
