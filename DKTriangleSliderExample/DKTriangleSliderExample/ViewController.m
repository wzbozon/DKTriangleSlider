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
    self.slider.backgroundColor = [UIColor clearColor];
    self.valueLabel.text = nil;
}


- (IBAction)sliderValueChanged:(id)sender
{
    self.valueLabel.text = [NSString stringWithFormat:@"%ld", self.slider.value];
}


@end
