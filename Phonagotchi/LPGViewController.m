//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "ONEPet.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic, strong) ONEPet *myPet;
@property (nonatomic) UIImageView *bucketImageView;
@property (nonatomic) UIImageView *appleImageView;
@property (nonatomic) UIImageView *appleCopyImageView;


@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    ONEPet *myPet = [ONEPet new];
    
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    //Pet view
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    [self.petImageView setUserInteractionEnabled:YES];
    
    //Bucket view
    
    self.bucketImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bucketImageView.image = [UIImage imageNamed:@"bucket"];
    [self.view addSubview:self.bucketImageView];
    
    [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0
                                  constant:30.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                 attribute:NSLayoutAttributeBottomMargin
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottomMargin
                                multiplier:1.0
                                  constant:-30.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem: self.bucketImageView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1
                                  constant:100]. active = YES;
    
    [NSLayoutConstraint constraintWithItem: self.bucketImageView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1
                                  constant:100]. active = YES;
    
    //Apple view
   
    self.appleImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.appleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.appleImageView.image = [UIImage imageNamed:@"apple"];
    [self.view addSubview:self.appleImageView];
    
    [NSLayoutConstraint constraintWithItem:self.appleImageView
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0
                                  constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleImageView
                                 attribute:NSLayoutAttributeBottomMargin
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottomMargin
                                multiplier:1.0
                                  constant:-70.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem: self.appleImageView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1
                                  constant:70]. active = YES;
    
    [NSLayoutConstraint constraintWithItem: self.appleImageView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1
                                  constant:70]. active = YES;
    
    [self.appleImageView setUserInteractionEnabled:YES];
    
    
    //Init copy of the apple with the apple's frame
    self.appleCopyImageView = [[UIImageView alloc]initWithFrame:self.appleImageView.frame];
    self.appleCopyImageView.image = [UIImage imageNamed:@"apple"];
    [self.appleCopyImageView setUserInteractionEnabled:YES];
    
    // Pet the cat
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(petTheCat:)];
    [self.petImageView addGestureRecognizer:panRecognizer];
    
    // Feed the cat
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(feedTheCat:)];
    [self.appleImageView addGestureRecognizer:pinchRecognizer];
}

-(void)petTheCat: (UIPanGestureRecognizer *) sender {
    CGPoint petVelocity =  [sender velocityInView:self.petImageView];
    if (petVelocity.x < 5000 || petVelocity.y < 5000) {
    self.petImageView.image=[UIImage imageNamed:@"grumpy.png"];
    }
}

-(void)feedTheCat: (UIPinchGestureRecognizer *) sender {
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"Creating copy of the apple");
            [self.view addSubview:self.appleImageView];
            
            
            break;
        case UIGestureRecognizerStateChanged:
            NSLog(@"Changed");

        
            break;
            
        case UIGestureRecognizerStateEnded:
            NSLog(@"Ended");

            break;
        default:
            break;
    }
    
    
}

@end
