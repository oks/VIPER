//
//  ANAppColorTheme.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAppColorTheme.h"

static CGFloat const kNavigationBarIconHeight = 20;

@interface ANAppColorTheme ()

@property (nonatomic, strong) UIColor* navBarbackgroundColor;
@property (nonatomic, strong) UIColor* navBarFontColor;

@end

@implementation ANAppColorTheme

+ (instancetype)shared
{
    static id _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [self new];
    });
    return _sharedClient;
}

+ (void)load
{
    [self setupFonts];
}

+ (void)setupFonts
{
    [UIFont an_addFontName:@"HelveticaNeue-Light" forType:ANFontTypeLight];
    [UIFont an_addFontName:@"HelveticaNeue" forType:ANFontTypeRegular];
    [UIFont an_addFontName:@"HelveticaNeue-Medium" forType:ANFontTypeMedium];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.baseColor = [UIColor an_colorWithHexString:@"ac1e44"];
        
        self.navBarFontColor = [UIColor whiteColor];
        self.textGrayColor = [UIColor an_colorWithHexString:@"7b7b81"];
        self.textLightGrayColor = [UIColor an_colorWithHexString:@"8e8e93"];
        
        self.baseBackgroundColor = [UIColor an_colorWithHexString:@"ebebf1"];
        self.baseFontColor = [UIColor an_colorWithHexString:@"5B5B5B"];
        
        self.baseCellTextColor = [UIColor an_colorWithHexString:@"202020"];
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
        [self setupAppearance];
    }
    return self;
}

- (void)setupAppearance
{
    [self _setupNavigationBar];
    [self _setupNavigationButtons];
}

- (void)_setupNavigationBar
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage an_imageWithColor:self.baseColor]
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    NSDictionary* titleAttributes = @{NSForegroundColorAttributeName : self.navBarFontColor,
                                      NSFontAttributeName            : [UIFont an_regularFontWithSize:17],
                                      NSKernAttributeName            : @(2.0)};
    
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttributes];
}

- (void)_setupNavigationButtons
{
    [self _addNavItemWithName:@"navbar_btn_back" type:ANBarButtonTypeBack];
    [self _addNavItemWithName:@"navbar_btn_close" type:ANBarButtonTypeClose];
    [self _addNavItemWithName:@"navbar_btn_done" type:ANBarButtonTypeDone];
    
    [self _addNavItemWithName:@"navbar_btn_add" type:ANBarButtonTypeAdd];
    [self _addNavItemWithName:@"navbar_btn_edit" type:ANBarButtonTypeEdit];
    [self _addNavItemWithName:@"navbar_btn_more" type:ANBarButtonTypeMore];
    //navbar_btn_single_task
}

- (void)_addNavItemWithName:(NSString*)name type:(ANBarButtonType)type
{
    UIImage* icon = [UIImage imageWithPDFNamed:name atHeight:kNavigationBarIconHeight];
    [UIBarButtonItem an_addImage:[icon an_imageByTintingWithColor:[UIColor whiteColor]] forType:type];
}

@end
