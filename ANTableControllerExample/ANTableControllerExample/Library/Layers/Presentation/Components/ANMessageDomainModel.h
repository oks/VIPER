//
//  ANMessageDomainModel.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 6/21/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@interface ANMessageDomainModel : NSObject

@property (nonatomic, copy) NSString* message;
@property (nonatomic, assign) BOOL isHTMLMessage;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSArray* recipients;
@property (nonatomic, strong) UIImage* image;

@end
