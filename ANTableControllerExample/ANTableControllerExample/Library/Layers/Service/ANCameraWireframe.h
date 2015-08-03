//
//  ANCameraWireframe.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 2/15/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

typedef void(^ANImageBlock)(UIImage* result);

@interface ANCameraWireframe : NSObject

- (void)presentCameraControllerFromViewController:(UIViewController*)vc completion:(ANImageBlock)completion;

@end
