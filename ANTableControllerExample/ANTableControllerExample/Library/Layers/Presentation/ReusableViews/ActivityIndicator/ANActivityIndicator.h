//
//  KMActivityIndicator.h
//  Yodablog
//
//  Created by Kevin Mindeguia on 19/08/2013.
//  Copyright (c) 2013 iKode Ltd. All rights reserved.
//

@interface ANActivityIndicator : UIView

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) BOOL hidesWhenStopped;

- (void)updateAnimatingStateTo:(BOOL)isAnimating;

- (void)startAnimating;
- (void)stopAnimating;

- (BOOL)isAnimating;

@end
