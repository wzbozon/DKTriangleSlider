//
//  ViewController.h
//  DKTriangleSliderExample
//
//  Created by Denis Kutlubaev on 20.09.17.
//
//

#import <UIKit/UIKit.h>
#import "DKTriangleSlider.h"

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet DKTriangleSlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *valueLabel;

- (IBAction)sliderValueChanged:(id)sender;

@end

