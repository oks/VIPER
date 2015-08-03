//
//  ANAppColorTheme.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANColorTheme.h"

@interface ANAppColorTheme : ANColorTheme

@property (nonatomic, strong) UIColor* baseCellTextColor;

+ (instancetype)shared;

@end
