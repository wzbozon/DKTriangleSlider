//
//  DKTriangleSliderValueLayer.m
//
//  Created by Denis Kutlubaev on 28.08.17.
//
//

#import "DKTriangleSliderValueLayer.h"
#import "DKTriangleSlider.h"


@implementation DKTriangleSliderValueLayer


- (void)drawInContext:(CGContextRef)ctx
{
    CGFloat layerHeight = self.bounds.size.height;
    CGFloat layerWidth = self.bounds.size.width;
    
    CGFloat a = layerWidth / self.slider.maxValue;
    CGFloat tangent = layerHeight / layerWidth;
    
    CGFloat w = a * self.slider.value;
    
    if (! self.slider.enabled) w = 0;
    
    CGFloat h = tangent * w;
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    
    [bezierPath moveToPoint:CGPointMake(0, layerHeight)];
    [bezierPath addLineToPoint:CGPointMake(w, layerHeight)];
    [bezierPath addLineToPoint:CGPointMake(w, layerHeight - h)];
    [bezierPath addLineToPoint:CGPointMake(0, layerHeight)];
    [bezierPath closePath];
    
    CGContextAddPath(ctx, bezierPath.CGPath);
    CGContextSetFillColorWithColor(ctx, self.slider.valueColor.CGColor);
    CGContextFillPath(ctx);
}


@end
