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

@property (nonatomic, weak) IBOutlet DKTriangleSlider *tringleSlider1;
@property (nonatomic, weak) IBOutlet DKTriangleSlider *tringleSlider2;
@property (nonatomic, weak) IBOutlet UILabel *valueLabel;
@property (nonatomic, weak) IBOutlet UISlider *slider;

- (IBAction)triangleSlider1ValueChanged:(id)sender;
- (IBAction)triangleSlider2ValueChanged:(id)sender;

- (IBAction)sliderValueChanged:(id)sender;

- (IBAction)sliderTouchUpInside:(id)sender;

- (IBAction)constantValueSwitched:(id)sender;

@end

