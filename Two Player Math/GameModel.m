//
//  GameModel.m
//  Two Player Math
//
//  Created by Errol Cheong on 2017-07-03.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateQuestion];
    }
    return self;
}

-(void)generateQuestion {
    int rand1 = arc4random_uniform(20) + 1;
    int rand2 = arc4random_uniform(20) + 1;
    int randType = arc4random_uniform(3);
    NSString *operator = [[NSString alloc] init];
    
    if (randType == 0) {
        operator = @"+";
        self.answer = rand1 + rand2;
    } else if (randType == 1){
        operator = @"-";
        if (rand1 > rand2){
            self.answer = rand1 - rand2;
        } else {
            self.answer = rand2 - rand1;
            int randSwap = rand1;
            rand1 = rand2;
            rand2 = randSwap;
        }
    } else {
        operator = @"*";
        self.answer = rand1 * rand2;
    }
    self.question = [NSString stringWithFormat:@"%i %@ %i?", rand1, operator, rand2];
}




@end
