//
//  SMWebViewController.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 30/12/14.
//  Copyright (c) 2014 ShipMate. All rights reserved.
//

#import "ANWebViewController.h"

@interface ANWebViewController ()

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation ANWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RACCommand* closeCommand = [RACCommand commandWithBlock:^{
        [self.webView stopLoading];
        [self.wireframe dismissWebController];
    }];
    
    [self.navigationItem an_addLeftBarButtonItem:[UIBarButtonItem an_itemWithType:ANBarButtonTypeClose command:closeCommand]];
    [self.navigationItem an_addRightBarButtonItem:[UIBarButtonItem an_itemWithType:ANBarButtonTypeDone command:closeCommand]];
    
    self.navigationButtonsHidden = YES;
    self.showActionButton = NO;
    self.showUrlWhileLoading = NO;
    
    self.loadingBarTintColor = [ANAppColorTheme shared].baseColor;
}

@end
