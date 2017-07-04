//
//  Player.m
//  Two Player Math
//
//  Created by Errol Cheong on 2017-07-03.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _score = 0;
        _lives = 3;
    }
    return self;
}



@end
