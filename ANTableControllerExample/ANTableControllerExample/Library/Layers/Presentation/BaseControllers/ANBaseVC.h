//
//  ANBaseVC.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@interface ANBaseVC : UIViewController

- (void)addRightNavigationButtonWithType:(ANBarButtonType)type block:(ANCodeBlock)block;
- (void)addLeftNavigationButtonWithType:(ANBarButtonType)type block:(ANCodeBlock)block;

@end
