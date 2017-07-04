//
//  GameModel.h
//  Two Player Math
//
//  Created by Errol Cheong on 2017-07-03.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject

@property (nonatomic, strong) NSString *question;
@property (nonatomic, assign) NSInteger answer;

- (void) generateQuestion;

@end
