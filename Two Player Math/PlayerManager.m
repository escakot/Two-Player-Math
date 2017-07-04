//
//  PlayerManager.m
//  Two Player Math
//
//  Created by Errol Cheong on 2017-07-03.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "PlayerManager.h"
#import "Player.h"

@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerTurn = 0;
        [self createPlayers];
    }
    return self;
}

- (BOOL) calcScore:(BOOL)answer {
    Player *currentPlayer = self.players[(self.playerTurn % 2)];
    if (answer){
        currentPlayer.score += 1;
    } else {
        currentPlayer.lives -= 1;
    }
    self.playerTurn += 1;
    
    if (currentPlayer.lives <= 0){
        return YES;
    } else {
        return NO;
    }
}

- (void) createPlayers {
    Player *player1 = [Player new];
    Player *player2 = [Player new];
    self.players = @[player1, player2];
}

- (NSUInteger) returnPlayerTurn {
    return (_playerTurn % 2) + 1;
}

- (NSUInteger) returnScoreAtPlayerIndex:(NSUInteger)player{
    Player* playerIndex = self.players[player];
    return playerIndex.score;
}

@end
