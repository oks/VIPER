//
//  ANNetworkNoContentView.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANNetworkNoContentView.h"

@interface ANNetworkNoContentView ()

@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UILabel* label;

@end

@implementation ANNetworkNoContentView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self imageView];
        [self label];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.label.preferredMaxLayoutWidth = self.bounds.size.width;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_centerY);
            make.width.height.equalTo(@50);
            make.centerX.equalTo(self);
        }];
    }
    return _imageView;
}

- (UILabel*)label
{
    if (!_label)
    {
        _label = [UILabel new];
        _label.font = [UIFont an_regularFontWithSize:15];
        _label.textColor = [ANAppColorTheme shared].baseColor;
        _label.text = NSLocalizedString(@"loading-view.empty.label", nil);
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
        [self addSubview:_label];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_centerY);
            make.centerX.equalTo(self);
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
        }];
    }
    return _label;
}

@end
