//
//  ANTAddCategoryImageView.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryImageView.h"

static CGFloat const kLabelWidth = 100;
static CGFloat const kLabelHeight = 30;

@interface ANAddCategoryImageView ()

@property (nonatomic, strong) UILabel* addPhotoLabel;

@end

@implementation ANAddCategoryImageView

- (instancetype)init
{
    if (self = [super init])
    {
        [RACObserve(self, image) subscribeNext:^(UIImage *image) {
            self.addPhotoLabel.hidden = (image != nil);
        }];
    }
    return self;
}

- (UILabel*)addPhotoLabel
{
    if (!_addPhotoLabel)
    {
        _addPhotoLabel = [UILabel new];
        _addPhotoLabel.text = NSLocalizedString(@"add-category.add-photo.placeholder", nil);
        _addPhotoLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_addPhotoLabel];
        
        [_addPhotoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(kLabelWidth));
            make.height.equalTo(@(kLabelHeight));
        }];
    }
    return _addPhotoLabel;
}

@end
