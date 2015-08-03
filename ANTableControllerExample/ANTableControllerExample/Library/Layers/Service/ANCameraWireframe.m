//
//  ANCameraWireframe.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 2/15/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANCameraWireframe.h"
#import "DBCameraViewController.h"
#import "DBCameraContainerViewController.h"

@interface ANCameraWireframe() <DBCameraViewControllerDelegate>

@property (nonatomic, copy) ANImageBlock completion;
@property (nonatomic, strong) UIViewController* presentedController;
@property (nonatomic, strong) UINavigationController* cameraController;

@end

@implementation ANCameraWireframe

- (void)presentCameraControllerFromViewController:(UIViewController *)vc completion:(ANImageBlock)completion
{
    DBCameraViewController *cameraController = [DBCameraViewController initWithDelegate:self];
    [cameraController setForceQuadCrop:YES];
    
    DBCameraContainerViewController *container = [[DBCameraContainerViewController alloc] initWithDelegate:self];
    [container setCameraViewController:cameraController];
    [container setFullScreenMode];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:container];
    nav.navigationBarHidden = YES;
    
    [vc presentViewController:nav animated:YES completion:nil];
    
    self.cameraController = nav;
    self.presentedController = vc;
    self.completion = completion;
}


#pragma mark DBCamera Delegate

- (void)backFromController:(id)fromController
{
    [self.cameraController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissCamera:(id)cameraViewController
{
     [self.cameraController dismissViewControllerAnimated:YES completion:nil];
}

- (void)camera:(id)cameraViewController didFinishWithImage:(UIImage *)image withMetadata:(NSDictionary *)metadata
{
    if (self.completion)
    {
        self.completion(image);
    }
    [self backFromController:cameraViewController];
}

@end
