//
//  ONEPet.m
//  Phonagotchi
//
//  Created by Olga on 10/12/17.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "ONEPet.h"

@implementation ONEPet

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isGrampy = NO;
    }
    return self;
}

-(void)makeCatGrumpy {
    _isGrampy = YES;
}

@end
