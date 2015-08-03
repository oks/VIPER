//
//  KMActivityIndicator.m
//  Yodablog
//
//  Created by Kevin Mindeguia on 19/08/2013.
//  Copyright (c) 2013 iKode Ltd. All rights reserved.
//

#import "ANActivityIndicator.h"

static CGFloat const kIndicatorAnimationDuration = 0.5;

@interface ANActivityIndicator ()

@property (nonatomic, assign) float dotRadius;
@property (nonatomic, assign) int stepNumber;
@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, assign) CGRect firstPoint, secondPoint, thirdPoint, fourthPoint;
@property (nonatomic, strong) CALayer *firstDot, *secondDot, *thirdDot;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ANActivityIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupViewLayout:frame];
    }
    return self;
}

- (void)setupViewLayout:(CGRect)frame
{
    _stepNumber = 0;
    _isAnimating = NO;
    self.hidesWhenStopped = YES;
    self.color = [UIColor colorWithRed:241/255.0f green:196/255.0f blue:15/255.0f alpha:1.0];
    
    _dotRadius = frame.size.height <= frame.size.width ? frame.size.width/12 : frame.size.height/12;
    _firstPoint = CGRectMake(frame.size.width/4-_dotRadius, frame.size.height/2-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    _secondPoint = CGRectMake(frame.size.width/2-_dotRadius, frame.size.height/4-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    _thirdPoint = CGRectMake(3*frame.size.width/4-_dotRadius, frame.size.height/2-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    _fourthPoint = CGRectMake(frame.size.width/2-_dotRadius, 3*frame.size.height/4-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    
    //First dot is the one that moves straight up and down
    _firstDot = [self _createDot];
    _firstDot.frame = _fourthPoint;
    
    //Second dot is the one that moves straight left and right
    _secondDot = [self _createDot];
    _secondDot.frame = _firstPoint;
    
    //Third dot is the one that moves around all four positions clockwise
    _thirdDot = [self _createDot];
    _thirdDot.frame = _thirdPoint;
    
    [self.layer addSublayer:_firstDot];
    [self.layer addSublayer:_secondDot];
    [self.layer addSublayer:_thirdDot];
    
    self.layer.hidden = YES;
}

- (CALayer*)_createDot
{
    CALayer* dot = [CALayer layer];
    dot.masksToBounds = YES;
    dot.backgroundColor = self.color.CGColor;
    dot.cornerRadius = _dotRadius;
    dot.bounds = CGRectMake(0.0f, 0.0f, _dotRadius*2, _dotRadius*2);
    return dot;
}

- (void)updateAnimatingStateTo:(BOOL)isAnimating
{
    if (isAnimating)
    {
        [self startAnimating];
    }
    else
    {
        [self stopAnimating];
    }
}

-(void)startAnimating
{
    if (!_isAnimating)
    {
        _isAnimating = YES;
        self.layer.hidden = NO; // TODO: display link
       _timer = [NSTimer scheduledTimerWithTimeInterval:kIndicatorAnimationDuration
                                                 target:self
                                               selector:@selector(animateNextStep)
                                               userInfo:nil
                                                repeats:YES];
    }
}

-(void)stopAnimating
{
    _isAnimating = NO;
    if (self.hidesWhenStopped)
        self.layer.hidden = YES;
    [_timer invalidate];
    _stepNumber = 0;
    _firstDot.frame = _fourthPoint;
    _secondDot.frame = _firstPoint;
    _thirdDot.frame = _thirdPoint;
}

-(void)animateNextStep
{
    switch (_stepNumber)
    {
        case 0:
            [CATransaction begin];
            [CATransaction setAnimationDuration:kIndicatorAnimationDuration];
            _firstDot.frame = _secondPoint;
            _thirdDot.frame = _fourthPoint;
            [CATransaction commit];
            break;
        case 1:
            [CATransaction begin];
            [CATransaction setAnimationDuration:kIndicatorAnimationDuration];
            _secondDot.frame = _thirdPoint;
            _thirdDot.frame = _firstPoint;
            [CATransaction commit];
            break;
        case 2:
            [CATransaction begin];
            [CATransaction setAnimationDuration:kIndicatorAnimationDuration];
            _firstDot.frame = _fourthPoint;
            _thirdDot.frame = _secondPoint;
            [CATransaction commit];
            break;
        case 3:
            [CATransaction begin];
            [CATransaction setAnimationDuration:kIndicatorAnimationDuration];
            _secondDot.frame = _firstPoint;
            _thirdDot.frame = _thirdPoint;
            [CATransaction commit];
            break;
        case 4:
            [CATransaction begin];
            [CATransaction setAnimationDuration:kIndicatorAnimationDuration];
            _firstDot.frame = _secondPoint;
            _thirdDot.frame = _fourthPoint;
            [CATransaction commit];
            _stepNumber = 0;
        default:
            break;
    }
    
    _stepNumber++;
}

- (BOOL)isAnimating
{
    return _isAnimating;
}


@end
