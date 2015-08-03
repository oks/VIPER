//
//  SMWebViewController.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 30/12/14.
//  Copyright (c) 2014 ShipMate. All rights reserved.
//

#import "TOWebViewController.h"

@protocol ANWebViewControllerDelegate <NSObject>

- (void)dismissWebController;

@end

@interface ANWebViewController : TOWebViewController

@property (nonatomic, weak) id<ANWebViewControllerDelegate> wireframe;

@end
