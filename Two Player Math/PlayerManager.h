//
//  PlayerManager.h
//  Two Player Math
//
//  Created by Errol Cheong on 2017-07-03.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;
@interface PlayerManager : NSObject

@property (nonatomic, assign) NSUInteger playerTurn;
@property (nonatomic, strong) NSArray *players;


- (BOOL) calcScore:(BOOL)answer;
- (void) createPlayers;
- (NSUInteger) returnPlayerTurn;
- (NSUInteger) returnScoreAtPlayerIndex:(NSUInteger)player;


@end
