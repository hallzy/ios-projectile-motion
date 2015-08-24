

//
//  ViewController.m
//  Projectile Motion
//
//  Created by Steven Hall on 2014-05-17.
//  Copyright (c) 2014 Hallzy.18@gmail.com. All rights reserved.
//

#import "ViewController.h"

#define VERBOSE 1

@interface ViewController ()

@end

@implementation ViewController

 @synthesize gravityInput;
 @synthesize verticalVelocityInput;
 @synthesize HeightInput;
 @synthesize velocityInput;
 
 @synthesize timeToHitGroundLabel;
 @synthesize distaceTravelledLabel; // ground
 @synthesize timeMaxHeightLabel;
 @synthesize distanceTravelledLabel; // max
 

- (IBAction)solveButton:(id)sender{
 double timeToGroundp;
 double timeToGroundm;
 double gravity = [gravityInput.text doubleValue] ;
 double verticalVelocity = [verticalVelocityInput.text doubleValue] ;
 double height = [HeightInput.text doubleValue];
 double velocity = [velocityInput.text doubleValue];
    
    gravity = -1*gravity;

 if (VERBOSE) {
     NSLog(@"Solve Button Before any Calculations");
  }

 // Time To Hit Ground
 timeToGroundp = (-1*(verticalVelocity) + sqrt( (verticalVelocity * verticalVelocity) - (2*gravity*height) ) )/gravity;
 timeToGroundm = (-1*(verticalVelocity) - sqrt( (verticalVelocity * verticalVelocity) - (2*gravity*height) ) )/gravity;
 
 if (timeToGroundp < 0) {
     if (timeToGroundm >= 0) {
         timeToHitGroundLabel.text = [NSString stringWithFormat:@"%f", timeToGroundm];
     }
     else if (timeToGroundm < 0){
         timeToHitGroundLabel.text = @"N/A";
    }
 }
 else if (timeToGroundp > 0){
    if (timeToGroundm > 0) {
        timeToHitGroundLabel.text = @"N/A";
    }
    else if (timeToGroundm <= 0){
        timeToHitGroundLabel.text = [NSString stringWithFormat:@"%f", timeToGroundp];
    }
 }
 else if (timeToGroundp == 0){
     if (timeToGroundm == 0 || timeToGroundm < 0) {
         timeToHitGroundLabel.text = @"0";
     }
     else if (timeToGroundm > 0){
         timeToHitGroundLabel.text = [NSString stringWithFormat:@"%f", timeToGroundm];
     }
 }
    
    NSLog(@"\n\ntimeToGroundp = %f\ntimeToGoundm = %f", timeToGroundp, timeToGroundm);
 
 
 // distance to ground
 
 distaceTravelledLabel.text = [NSString stringWithFormat:@"%f", velocity*[timeToHitGroundLabel.text doubleValue]];
    
    NSLog(@"distanceTravelledLabel.text = %f", velocity*timeToGroundm);
 
 // timeMax use derivative...
 timeMaxHeightLabel.text = [NSString stringWithFormat:@"%f", (-1*verticalVelocity/gravity)];
    
    NSLog(@"timeMaxHeightLabel.text = %f", -verticalVelocity/gravity);
 
 // Distance to max
 
 distanceTravelledLabel.text = [NSString stringWithFormat:@"%f", ((-verticalVelocity/gravity)*velocity)];
    
    NSLog(@"distancetravelledlabel.text = %f", ((-verticalVelocity/gravity)*velocity));
 

}

- (IBAction)earthButton:(id)sender {
    gravityInput.text = @"9.8067";
}

- (IBAction)moonButton:(id)sender {
    gravityInput.text = @"1.625";
}

- (IBAction)marsButton:(id)sender {
    gravityInput.text = @"3.728";
}

- (IBAction)sunButton:(id)sender {
    gravityInput.text = @"274.1";
}

- (IBAction)jupiterButton:(id)sender {
    gravityInput.text = @"25.93";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    bannerView = [[ADBannerView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 516)];
}

- (IBAction)textFieldReturn:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)BackgroundTap:(id)sender{
    [gravityInput resignFirstResponder];
    [verticalVelocityInput resignFirstResponder];
    [HeightInput resignFirstResponder];
    [velocityInput resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - adViewDelegates

- (void) bannerView: (ADBannerView *) banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Error Loading Ad");
}

- (void) bannerViewDidLoadAd: (ADBannerView *) banner{
    NSLog(@"Ad Loaded");
}

- (void) bannerViewWillLoadAd: (ADBannerView *) banner{
    NSLog(@"Ad will load");
}

- (void) bannerViewActionDidFinish: (ADBannerView *) banner{
    NSLog(@"Ad Did Finish");
}

@end

