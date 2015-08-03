//
//  ANAnimator.h
//
//  Created by Oksana Kovalchuk on 15/12/14.
//
//

@class MASConstraint;

@interface ANAnimator : NSObject

#pragma mark - CATransition

+ (CATransition*)simpleTransitionWithDuration:(CGFloat)duration;
+ (void)addSimpleTransitionToLayer:(CALayer*)layer duration:(CGFloat)duration;


#pragma mark - Constraints

+ (void)animateConstraint:(MASConstraint*)constraint newOffset:(CGFloat)offset key:(NSString*)key;
+ (void)animateConstraint:(MASConstraint*)constraint
                newOffset:(CGFloat)offset
                      key:(NSString*)key
                    delay:(CFTimeInterval)delay
             bouncingRate:(NSUInteger)bounce;

+ (void)animateConstraint:(MASConstraint *)constraint
                newOffset:(CGFloat)offset
                      key:(NSString *)key
                    delay:(CFTimeInterval)delay
             bouncingRate:(NSUInteger)bounce
               completion:(ANCodeBlock)completion;

#pragma mark - Scale

+ (void)animateScaleOnView:(UIView*)view key:(NSString*)key;


#pragma mark - Alpha

+ (void)animateAlphaLinearOnView:(UIView *)view value:(CGFloat)value key:(NSString *)key;
+ (void)animateAlphaLinearOnView:(UIView *)view value:(CGFloat)alpha key:(NSString *)key delay:(CFTimeInterval)delay;


#pragma mark - Rotation

+ (void)rotateView:(UIView *)view onValue:(NSInteger)rotation key:(NSString *)key;


@end
