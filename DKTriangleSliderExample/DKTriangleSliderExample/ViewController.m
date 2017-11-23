//
//  ViewController.m
//  DKTriangleSliderExample
//
//  Created by Denis Kutlubaev on 20.09.17.
//
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.valueLabel.text = nil;
}

- (IBAction)triangleSliderValueChanged:(id)sender
{
    self.valueLabel.text = [NSString stringWithFormat:@"%ld", self.tringleSlider.value];
    self.slider.value = self.tringleSlider.value;
    self.tringleSlider.value = self.tringleSlider.value;
}

- (IBAction)sliderValueChanged:(id)sender
{
    long roundValue = lroundf(self.slider.value);
    self.valueLabel.text = [NSString stringWithFormat:@"%ld", roundValue];
    self.tringleSlider.value = roundValue;
}

- (IBAction)constantValueSwitched:(id)sender
{
    // I am using ReactiveCocoa to do this kind of things
    // But I do not want to add a dependency to this example project
    UISwitch *switchView = (UISwitch *)sender;
    self.tringleSlider.constantValue = switchView.on ? 3 : 0;
    self.valueLabel.text = @"3";
    self.slider.enabled = ! switchView.on;
    self.slider.value = 3;
}

@end
