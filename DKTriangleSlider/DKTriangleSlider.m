//
//  DKTriangleSlider.m
//
//  Created by Denis Kutlubaev on 28.08.17.
//
//

#import "DKTriangleSlider.h"
#import <QuartzCore/QuartzCore.h>
#import "DKTriangleSliderTrackLayer.h"
#import "DKTriangleSliderValueLayer.h"


@interface DKTriangleSlider()

@property (nonatomic, strong) NSArray *lineArray;
@property (nonatomic, strong) DKTriangleSliderTrackLayer *trackLayer;
@property (nonatomic, strong) DKTriangleSliderValueLayer *fillLayer;
@property (nonatomic) CGPoint previousTouchPoint;

@end


@implementation DKTriangleSlider


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        _max = 3;
        _trackLayer = [DKTriangleSliderTrackLayer layer];
        _trackLayer.slider = self;
        [self.layer addSublayer:_trackLayer];
        
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 1; i < _max; i ++)
        {
            CALayer *layer = [CALayer layer];
            layer.backgroundColor = [UIColor whiteColor].CGColor;
            layer.zPosition = 10;
            [self.layer addSublayer:layer];
            [temp addObject:layer];
        }
        _lineArray = [NSArray arrayWithArray:temp];
        
        _fillLayer = [DKTriangleSliderValueLayer layer];
        _fillLayer.slider = self;
        [self.layer addSublayer:_fillLayer];
        
        [self setLayerFrames];
    }
    
    return self;
}


- (void)setValue:(NSInteger)value
{
    if (value < 0) value = 0;
    
    if (value > self.max) value = self.max;
    
    _value = value;

    [self setLayerFrames];
}


- (void)setLayerFrames
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    _trackLayer.frame = self.bounds;
    _fillLayer.frame = self.bounds;
    
    CGFloat a = self.bounds.size.width / self.max;
    CGFloat h = self.bounds.size.height;
    
    for (int i = 1; i < self.max; i ++)
    {
        CALayer *layer = self.lineArray[i - 1];
        layer.frame = CGRectMake(i * a, 0, 1, h);
    }
    
    [_trackLayer setNeedsDisplay];
    [_fillLayer setNeedsDisplay];
    
    [CATransaction commit];
}


- (void)layoutSubviews
{
    [self setLayerFrames];
}


- (void)didTouchAtPoint:(CGPoint)point
{
    if (! self.enabled) return;
    
    CGFloat a = self.bounds.size.width / self.max;
    _value = ceil(point.x / a);
    
    if (_value <= 0)
    {
        _value = 1;
    }
    
    if (_value >= self.max)
    {
        _value = self.max;
    }

    [self setLayerFrames];

    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:self];
    
    [self didTouchAtPoint:touchPoint];
    
    return YES;
}


- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:self];
    
    [self didTouchAtPoint:touchPoint];
    
    return YES;
}


- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}


@end
