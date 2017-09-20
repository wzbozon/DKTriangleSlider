//
//  ViewController.m
//  DKTriangleSliderExample
//
//  Created by Denis Kutlubaev on 20.09.17.
//
//

#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tringleSlider1.backgroundColor = [UIColor clearColor];
    self.tringleSlider2.backgroundColor = [UIColor clearColor];
    self.valueLabel.text = nil;
}


- (IBAction)triangleSlider1ValueChanged:(id)sender
{
    self.valueLabel.text = [NSString stringWithFormat:@"%ld", self.tringleSlider1.value];
    self.slider.value = self.tringleSlider1.value;
    self.tringleSlider2.value = self.tringleSlider1.value;
}


- (IBAction)triangleSlider2ValueChanged:(id)sender
{
    self.valueLabel.text = [NSString stringWithFormat:@"%ld", self.tringleSlider2.value];
    self.slider.value = self.tringleSlider2.value;
    self.tringleSlider1.value = self.tringleSlider2.value;
}


- (IBAction)sliderValueChanged:(id)sender
{
    long roundValue = lroundf(self.slider.value);
    self.valueLabel.text = [NSString stringWithFormat:@"%ld", roundValue];
    self.tringleSlider1.value = roundValue;
    self.tringleSlider2.value = roundValue;
}


- (IBAction)sliderTouchUpInside:(id)sender
{
    return;
    
    /*
    // Action Hooked to 'Touch Up Inside' (when user releases knob)
    // Adjust knob (to rounded value)
    long roundValue = lroundf(self.slider.value);
    if (self.slider.value != roundValue) {
        // Almost 100% of the time - Adjust:
        self.slider.value = roundValue;
    }
    */
}


@end
