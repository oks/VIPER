//
//  ANNetworkErrorView.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANNetworkRetryView.h"

@interface ANNetworkRetryView ()

@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIButton* button;

@end

@implementation ANNetworkRetryView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self button];
        [self label];
    }
    return self;
}

- (UIButton*)button
{
    if (!_button)
    {
        _button = [UIButton new];
        [_button setImage:[UIImage imageNamed:@"refresh_button"] forState:UIControlStateNormal];
        [self addSubview:_button];
        
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@50);
            make.bottom.equalTo(self.mas_centerY);
            make.centerX.equalTo(self);
        }];
    }
    return _button;
}

- (UILabel*)label
{
    if (!_label)
    {
        _label = [UILabel new];
        _label.font = [UIFont an_regularFontWithSize:15];
        _label.textColor = [ANAppColorTheme shared].baseColor;
        _label.text = NSLocalizedString(@"loading-view.retry.label", nil);
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.button.mas_bottom).offset(12);
            make.height.equalTo(@18);
            make.width.equalTo(@165);
            make.centerX.equalTo(self);
        }];
    }
    return _label;
}

@end
