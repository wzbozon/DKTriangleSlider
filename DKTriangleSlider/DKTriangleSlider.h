//
//  DKTriangleSlider.h
//
//  Created by Denis Kutlubaev on 28.08.17.
//
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface DKTriangleSlider : UIControl

@property (nonatomic, strong) IBInspectable UIColor *trackColor;
@property (nonatomic, strong) IBInspectable UIColor *valueColor;
@property (nonatomic, assign) IBInspectable NSInteger value;

/**
 The maximum value of the slider.
 */
@property (nonatomic, assign) IBInspectable NSInteger maxValue;

@end
