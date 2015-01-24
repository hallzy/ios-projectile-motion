
//
//  ViewController.h
//  Projectile Motion
//
//  Created by Steven Hall on 2014-05-17.
//  Copyright (c) 2014 Hallzy.18@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController{
    IBOutlet UITextField *gravityInput;
    IBOutlet UITextField *verticalVelocityInput;
    IBOutlet UITextField *HeightInput;
    IBOutlet UITextField *velocityInput;
    IBOutlet UILabel *timeToHitGroundLabel;
    IBOutlet UILabel *distaceTravelledLabel; // ground
    IBOutlet UILabel *timeMaxHeightLabel;
    IBOutlet UILabel *distanceTravelledLabel; // max
    
    ADBannerView *bannerView;
    
    IBOutlet UIScrollView *scroller;
}

 @property (strong, nonatomic) IBOutlet UITextField *gravityInput;
 @property (strong, nonatomic) IBOutlet UITextField *verticalVelocityInput;
 @property (strong, nonatomic) IBOutlet UITextField *HeightInput;
 @property (strong, nonatomic) IBOutlet UITextField *velocityInput;
 @property (strong, nonatomic) IBOutlet UILabel *timeToHitGroundLabel;
 @property (strong, nonatomic) IBOutlet UILabel *distaceTravelledLabel; // ground
 @property (strong, nonatomic) IBOutlet UILabel *timeMaxHeightLabel;
 @property (strong, nonatomic) IBOutlet UILabel *distanceTravelledLabel; // max


//- (IBAction)gravitySelection:(id)sender;
- (IBAction)solveButton:(id)sender;
- (IBAction)earthButton:(id)sender;
- (IBAction)moonButton:(id)sender;
- (IBAction)marsButton:(id)sender;
- (IBAction)sunButton:(id)sender;
- (IBAction)jupiterButton:(id)sender;

@end
