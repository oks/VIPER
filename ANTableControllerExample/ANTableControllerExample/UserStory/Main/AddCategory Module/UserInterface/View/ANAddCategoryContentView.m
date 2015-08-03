//
//  ANTAddCategoryContentView.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/12/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryContentView.h"
#import "ANAddCategoryImageView.h"

static CGFloat const kTopOffset = 64;
static CGFloat const kTextFieldHeight = 40;
static CGFloat const kTextFieldWidth = 300;
static CGFloat const kImageViewWidth = 200;
static CGFloat const kImageViewHeight = 200;
static CGFloat const kImageViewTopOffset = 40;

@interface ANAddCategoryContentView ()

@end

@implementation ANAddCategoryContentView

- (UITextField*)textField
{
    if (!_textField)
    {
        _textField = [UITextField new];
        _textField.layer.cornerRadius = 6.0;
        _textField.layer.borderWidth = 1.0;
        _textField.layer.borderColor = [UIColor blackColor].CGColor;
        _textField.placeholder = NSLocalizedString(@"add-category.textfield.placeholder", nil);
        _textField.returnKeyType = UIReturnKeyDone;
        [self addSubview:_textField];
     
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top).with.offset(kTopOffset);
            make.width.equalTo(@(kTextFieldWidth));
            make.height.equalTo(@(kTextFieldHeight));
        }];
    }
    return _textField;
}

- (UIImageView*)categoryImageView
{
    if (!_categoryImageView)
    {
        _categoryImageView = [ANAddCategoryImageView new];
        _categoryImageView.layer.cornerRadius = 6.0;
        _categoryImageView.layer.borderWidth = 1.0;
        _categoryImageView.layer.borderColor = [UIColor blackColor].CGColor;
        _categoryImageView.layer.masksToBounds = YES;
        _categoryImageView.userInteractionEnabled = YES;
        [self addSubview:_categoryImageView];
        
        [_categoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.textField.mas_bottom).with.offset(kImageViewTopOffset);
            make.width.equalTo(@(kImageViewWidth));
            make.height.equalTo(@(kImageViewHeight));
        }];
    }
    return _categoryImageView;
}

@end
