//
//  DKTriangleSliderTrackLayer.m
//
//  Created by Denis Kutlubaev on 28.08.17.
//
//

#import "DKTriangleSliderTrackLayer.h"
#import "DKTriangleSlider.h"


@implementation DKTriangleSliderTrackLayer


- (void)drawInContext:(CGContextRef)ctx
{
    self.contentsScale = [[UIScreen mainScreen] scale];
    
    CGFloat layerHeight = self.bounds.size.height;
    CGFloat layerWidth = self.bounds.size.width;
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    
    [bezierPath moveToPoint:CGPointMake(0, layerHeight)];
    [bezierPath addLineToPoint:CGPointMake(layerWidth, layerHeight)];
    [bezierPath addLineToPoint:CGPointMake(layerWidth, 0)];
    [bezierPath addLineToPoint:CGPointMake(0, layerHeight)];
    [bezierPath closePath];

    CGContextAddPath(ctx, bezierPath.CGPath);
    CGContextSetFillColorWithColor(ctx, self.slider.trackColor.CGColor);
    CGContextFillPath(ctx);
}

@end
