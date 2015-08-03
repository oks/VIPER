//
//  ANNetworkProgressView.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/11/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANNetworkProgressView.h"

@interface ANNetworkProgressView ()

@property (nonatomic, strong) UILabel* label;

@end

@implementation ANNetworkProgressView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self progressView];
        [self label];
    }
    return self;
}

- (ANActivityIndicator*)progressView
{
    if (!_progressView)
    {
        _progressView = [[ANActivityIndicator alloc] initWithFrame:CGRectMake(0, 0, 56, 56)];
        _progressView.color = [UIColor colorWithRed:232.0/255.0f green:35.0/255.0f blue:111.0/255.0f alpha:1.0];
        [self addSubview:_progressView];
        
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.height.equalTo(@56);
            make.bottom.equalTo(self.mas_centerY);
        }];
    }
    return _progressView;
}

- (UILabel*)label
{
    if (!_label)
    {
        _label = [UILabel new];
        _label.font = [UIFont an_regularFontWithSize:18];
        _label.textColor = [ANAppColorTheme shared].baseColor;
        _label.text = NSLocalizedString(@"loading-view.loading.label", nil);
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_centerY);
            make.height.equalTo(@18);
            make.width.equalTo(@165);
            make.centerX.equalTo(self);
        }];
    }
    return _label;
}

@end
