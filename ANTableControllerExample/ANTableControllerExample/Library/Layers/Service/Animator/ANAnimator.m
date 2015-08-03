//
//  ANAnimator.m
//
//  Created by Oksana Kovalchuk on 15/12/14.
//
//

#import "ANAnimator.h"
#import "MSSPopMasonry.h"

@implementation ANAnimator

+ (CATransition*)simpleTransitionWithDuration:(CGFloat)duration
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.1f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    return transition;
}

+ (void)addSimpleTransitionToLayer:(CALayer*)layer duration:(CGFloat)duration
{
    [layer addAnimation:[self simpleTransitionWithDuration:duration] forKey:NSStringFromSelector(_cmd)];
}


#pragma mark - POP

+ (void)animateConstraint:(MASConstraint*)constraint newOffset:(CGFloat)offset key:(NSString*)key
{
    [self animateConstraint:constraint newOffset:offset key:key delay:0 bouncingRate:8];
}

+ (void)animateConstraint:(MASConstraint *)constraint newOffset:(CGFloat)offset key:(NSString *)key delay:(CFTimeInterval)delay bouncingRate:(NSUInteger)bounce completion:(ANCodeBlock)completion
{
    POPSpringAnimation *animation = [constraint pop_animationForKey:key];
    if (!animation)
    {
        animation = [POPSpringAnimation new];
        animation.property = [POPAnimatableProperty mas_offsetProperty];
    }
    animation.toValue = @(offset);
    animation.springBounciness = bounce;
    animation.beginTime = delay;
    animation.completionBlock = ^(POPAnimation* animation, BOOL isFinished) {
        if (isFinished && completion)
        {
            completion();
        }
    };
    [constraint pop_addAnimation:animation forKey:key];
}

+ (void)animateConstraint:(MASConstraint*)constraint
                newOffset:(CGFloat)offset
                      key:(NSString*)key
                    delay:(CFTimeInterval)delay
             bouncingRate:(NSUInteger)bounce
{
    [self animateConstraint:constraint newOffset:offset key:key delay:delay bouncingRate:bounce completion:nil];
}

+ (void)animateScaleOnView:(UIView*)view key:(NSString*)key
{
    POPSpringAnimation *scaleAnimation = [view pop_animationForKey:key];
    if (!scaleAnimation)
    {
        scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    }
    
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(2.5, 2.5)];
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    scaleAnimation.springBounciness = 0;
    [view.layer pop_addAnimation:scaleAnimation forKey:key];
}

+ (void)animateAlphaLinearOnView:(UIView *)view value:(CGFloat)value key:(NSString *)key
{
    [self animateAlphaLinearOnView:view value:value key:key delay:0];
}

+ (void)animateAlphaLinearOnView:(UIView *)view value:(CGFloat)alpha key:(NSString *)key delay:(CFTimeInterval)delay
{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.toValue = @(alpha);
    anim.beginTime = delay;
    [view pop_addAnimation:anim forKey:key];
}

+ (void)rotateView:(UIView *)view onValue:(NSInteger)rotation key:(NSString *)key
{
    POPSpringAnimation *rotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotate.toValue = @(rotation);
    rotate.springBounciness = 13.00f;
    rotate.springSpeed = 2.0f;
    [view.layer pop_addAnimation:rotate forKey:key];
}


@end
