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

@property (nonatomic, strong) CALayer *line1Layer;
@property (nonatomic, strong) CALayer *line2Layer;
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
        _trackLayer = [DKTriangleSliderTrackLayer layer];
        _trackLayer.slider = self;
        [self.layer addSublayer:_trackLayer];
        
        _line1Layer = [CALayer layer];
        _line1Layer.backgroundColor = [UIColor whiteColor].CGColor;
        _line1Layer.zPosition = 10;
        [self.layer addSublayer:_line1Layer];
        
        _line2Layer = [CALayer layer];
        _line2Layer.backgroundColor = [UIColor whiteColor].CGColor;
        _line2Layer.zPosition = 10;
        [self.layer addSublayer:_line2Layer];
        
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
    
    if (value > 3) value = 3;
    
    _value = value;

    [self setLayerFrames];
}


- (void)setLayerFrames
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    _trackLayer.frame = self.bounds;
    _fillLayer.frame = self.bounds;
    
    CGFloat a = self.bounds.size.width / 3.0;
    CGFloat h = self.bounds.size.height;
    _line1Layer.frame = CGRectMake(a, 0, 1, h);
    _line2Layer.frame = CGRectMake(2 * a, 0, 1, h);
    
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
    
    CGFloat a = self.bounds.size.width / 3.0;
    _value = ceil(point.x / a);
    
    if (_value <= 0)
    {
        _value = 1;
    }
    
    if (_value >= 3)
    {
        _value = 3;
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
