//
//  ANEmailPresenter.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/23/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@class ANMessageDomainModel;

@interface ANEmailWireframe : NSObject

- (void)presentEmailControllerFromViewController:(UIViewController*)vc
                                       withModel:(ANMessageDomainModel*)model
                                      completion:(ANCodeBlock)completion;

@end
