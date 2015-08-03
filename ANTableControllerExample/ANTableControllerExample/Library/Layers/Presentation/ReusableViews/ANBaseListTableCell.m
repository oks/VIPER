//
//  ANBaseListTableCell.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 4/11/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "ANBaseListTableCell.h"

@interface ANBaseListTableCell ()

@end

@implementation ANBaseListTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        /*
         self.contentView.backgroundColor = [UIColor whiteColor];
         SETTING background color for cell will overlaps table cell separator,
         if you need to set color - do it for cell self.backgroundColor = [UIColor redColor];
         */
        self.selectionColor = [ANAppColorTheme shared].baseColor;
    }
    return self;
}

- (void)updateConstraints
{
    CGFloat width = (self.iconImageView.image != nil) ? 50 : 0;
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
    }];
    
    [super updateConstraints];
}

- (void)updateWithModel:(id)model
{
    if ([model isKindOfClass:[NSString class]])
    {
        self.titleLabel.text = model;
        [self.iconImageView sizeToFit];
    }
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont an_regularFontWithSize:17];
        _titleLabel.highlightedTextColor = [UIColor whiteColor];
        _titleLabel.textColor = [ANAppColorTheme shared].baseCellTextColor;
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(10);
            make.right.top.bottom.equalTo(self);
        }];
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView)
    {
        _iconImageView = [UIImageView new];
        _iconImageView.clipsToBounds = YES;
        _iconImageView.layer.cornerRadius = 25;
        [self addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(5);
            make.height.width.equalTo(@(50));
            make.centerY.equalTo(self);
        }];
    }
    return _iconImageView;
}

@end
