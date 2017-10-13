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
    
    
    [self.bucketImageView setUserInteractionEnabled:YES];
    
    
    
    // Pet the cat
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(petTheCat:)];
    [self.petImageView addGestureRecognizer:panRecognizer];
    
}

-(void)petTheCat: (UIPanGestureRecognizer *) sender {
    CGPoint petVelocity =  [sender velocityInView:self.petImageView];
    if (petVelocity.x < 5000 || petVelocity.y < 5000) {
    self.petImageView.image=[UIImage imageNamed:@"grumpy.png"];
    }
}

@end
