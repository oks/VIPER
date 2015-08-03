//
//  ANAddCategoryVC.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/3/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANAddCategoryVC.h"
#import <pop/POP.h>
#import "ANAddCategoryContentView.h"

@interface ANAddCategoryVC ()

@property (nonatomic, strong) ANAddCategoryContentView* contentView;

@end

@implementation ANAddCategoryVC

 - (void)loadView
{
    self.contentView = [ANAddCategoryContentView new];
    self.view = self.contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"add-category.screen.title", nil);
    
    @weakify(self);
    
    [self addLeftNavigationButtonWithType:ANBarButtonTypeBack block:^{
        @strongify(self);
        [self.eventHandler dismissViewController];
    }];
    
    [self addRightNavigationButtonWithType:ANBarButtonTypeDone block:^{
        @strongify(self);
        [self _saveCategory];
    }];
    
    UITapGestureRecognizer* tap = [UITapGestureRecognizer new];
    [self.contentView.categoryImageView addGestureRecognizer:tap];
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        [self _touchAnimation];
        [self.eventHandler presentImagePicker];
    }];
}


#pragma mark - User Interface

- (void)updateSelectedImage:(UIImage*)image
{
    ANDispatchBlockToMainQueue(^{
        self.contentView.categoryImageView.image = image;
    });
}

- (void)showErrorMessageWithError:(NSError*)error
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"common.error", nil)
                               message:error.localizedDescription
                              delegate:nil
                      cancelButtonTitle:NSLocalizedString(@"common.ok", nil)
                      otherButtonTitles:nil, nil] show];
}


#pragma mark - Private

- (void)_saveCategory
{
    [self.eventHandler saveCategoryWithName:self.contentView.textField.text
                                      image:self.contentView.categoryImageView.image];
}

- (void)_touchAnimation
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 20;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.1, 1.1)];
    [self.contentView.categoryImageView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

@end
