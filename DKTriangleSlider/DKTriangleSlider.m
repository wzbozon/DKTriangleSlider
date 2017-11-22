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
        
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    if (self.constantValue) _value = self.constantValue;
}


// IBDesignable works only for code in drawRect
- (void)drawRect:(CGRect)rect
{
    if (self.constantValue) _value = self.constantValue;
    
    if (! _trackLayer)
    {
        _trackLayer = [DKTriangleSliderTrackLayer layer];
        _trackLayer.frame = rect;
        _trackLayer.slider = self;
        [self.layer addSublayer:_trackLayer];
        
        _fillLayer = [DKTriangleSliderValueLayer layer];
        _fillLayer.frame = rect;
        _fillLayer.slider = self;
        [self.layer addSublayer:_fillLayer];
    }
    
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 1; i < _maxValue; i ++)
    {
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.zPosition = 10;
        [self.layer addSublayer:layer];
        [temp addObject:layer];
    }
    _lineArray = [NSArray arrayWithArray:temp];
    
    [self setLayerFrames];
}

- (void)setValue:(NSInteger)value
{
    if (! self.enabled || self.constantValue) return;
    
    _value = value;
    
    //if (_value < 0) _value = 0;
    
    //if (_value > self.maxValue) _value = self.maxValue;

    [self setLayerFrames];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    [self setLayerFrames];
}

- (void)setConstantValue:(NSInteger)constantValue
{
    _constantValue = constantValue;
    
    if (_constantValue != 0)
    {
        self.value = _constantValue;
    }
    
    [self setNeedsDisplay];
}

- (void)setLayerFrames
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    CGFloat a = self.bounds.size.width / self.maxValue;
    CGFloat h = self.bounds.size.height;
    
    for (int i = 1; i < self.maxValue; i ++)
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
    if (! self.enabled || self.constantValue) return;
    
    CGFloat a = self.bounds.size.width / self.maxValue;
    _value = ceil(point.x / a);
    
    if (_value <= 0)
    {
        _value = 1;
    }
    
    if (_value >= self.maxValue)
    {
        _value = self.maxValue;
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
