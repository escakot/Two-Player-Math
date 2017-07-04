//
//  ViewController.m
//  Two Player Math
//
//  Created by Errol Cheong on 2017-07-03.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableString *answerString;
@property (nonatomic, assign) NSInteger *answerInteger;
@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic, strong) PlayerManager *manager;
@property (nonatomic, assign) BOOL gameOver;

@property (nonatomic, strong) UIAlertController *restartAlert;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (weak, nonatomic) IBOutlet UILabel *playerOneScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTurnLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.answerString = [[NSMutableString alloc] init];
    self.gameModel = [[GameModel alloc] init];
    self.manager = [[PlayerManager alloc] init];
    
    
    
    self.playerOneScore.text = [NSString stringWithFormat:@"Player 1: %li", [self.manager returnScoreAtPlayerIndex:0]];
    self.playerTwoScore.text = [NSString stringWithFormat:@"Player 2: %li", [self.manager returnScoreAtPlayerIndex:1]];
    self.playerTurnLabel.text = [NSString stringWithFormat:@"Player %li", [self.manager returnPlayerTurn]];
    
    self.question.text = [self.gameModel question];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enter:(id)sender {
    BOOL result = ([self.answer.text integerValue] == self.gameModel.answer);
    self.gameOver = [self.manager calcScore:result];
    
    if (result){
        [UIView animateWithDuration:1.0 animations:^{
            self.question.text = @"Correct!";
            self.question.textColor = UIColor.greenColor;
            self.question.alpha = 0.0;
        } completion:^(BOOL finished) {
            self.question.textColor = UIColor.blackColor;
            self.question.alpha = 1.0;
            [self.gameModel generateQuestion];
            self.question.text = [self.gameModel question];
        }];
    } else {
        [UIView animateWithDuration:1.0 animations:^{
            self.question.text = @"Wrong!";
            self.question.textColor = UIColor.redColor;
            self.question.alpha = 0.0;
        } completion:^(BOOL finished) {
            self.question.textColor = UIColor.blackColor;
            self.question.alpha = 1.0;
            [self.gameModel generateQuestion];
            self.question.text = [self.gameModel question];
        }];
        
    }
    if (self.gameOver) {
        self.restartAlert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:[NSString stringWithFormat:@"Player %li has won! Would you like to play again?", -(self.manager.playerTurn) % 2 + 1] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertYesButton = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.manager createPlayers];
            self.manager.playerTurn = 0;
            [self.gameModel generateQuestion];
            self.question.text = [self.gameModel question];
            self.playerOneScore.text = [NSString stringWithFormat:@"Player 1: %li", [self.manager returnScoreAtPlayerIndex:0]];
            self.playerTwoScore.text = [NSString stringWithFormat:@"Player 2: %li", [self.manager returnScoreAtPlayerIndex:1]];
            self.playerTurnLabel.text = [NSString stringWithFormat:@"Player %li", [self.manager returnPlayerTurn]];
        }];
        UIAlertAction *alertNoButton = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
        [self.restartAlert addAction:alertYesButton];
        [self.restartAlert addAction:alertNoButton];
        [self presentViewController:self.restartAlert animated:YES completion:nil];
    }
    self.playerOneScore.text = [NSString stringWithFormat:@"Player 1: %li", [self.manager returnScoreAtPlayerIndex:0]];
    self.playerTwoScore.text = [NSString stringWithFormat:@"Player 2: %li", [self.manager returnScoreAtPlayerIndex:1]];
    self.playerTurnLabel.text = [NSString stringWithFormat:@"Player %li", [self.manager returnPlayerTurn]];
    [self.answerString setString:@""]; self.answer.text = @"";
    
}
- (IBAction)clear:(id)sender {
    [self.answerString setString:@""];
    self.answer.text = self.answerString;
}
- (IBAction)one:(id)sender {
    [self.answerString appendString:@"1"];
    self.answer.text = self.answerString;
}
- (IBAction)two:(id)sender {
    [self.answerString appendString:@"2"];
    self.answer.text = self.answerString;
}
- (IBAction)three:(id)sender {
    [self.answerString appendString:@"3"];
    self.answer.text = self.answerString;
}
- (IBAction)four:(id)sender {
    [self.answerString appendString:@"4"];
    self.answer.text = self.answerString;
}
- (IBAction)five:(id)sender {
    [self.answerString appendString:@"5"];
    self.answer.text = self.answerString;
}
- (IBAction)six:(id)sender {
    [self.answerString appendString:@"6"];
    self.answer.text = self.answerString;
}
- (IBAction)seven:(id)sender {
    [self.answerString appendString:@"7"];
    self.answer.text = self.answerString;
}
- (IBAction)eight:(id)sender {
    [self.answerString appendString:@"8"];
    self.answer.text = self.answerString;
}
- (IBAction)nine:(id)sender {
    [self.answerString appendString:@"9"];
    self.answer.text = self.answerString;
}
- (IBAction)zero:(id)sender {
    [self.answerString appendString:@"0"];
    self.answer.text = self.answerString;
}

@end
