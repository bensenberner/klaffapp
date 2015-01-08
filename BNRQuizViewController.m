//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Benjamin Lerner on 12/30/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions = @[@"Who was the first president of the United States?",
                           @"Who wrote the Declaration of Independence?",
                           @"Who won the first ever Schreiber Slam?"];

        self.answers = @[@"George Washington",
                         @"Thomas Jefferson",
                         @"Abrajamz Lincoln"];
    }
    
    return self;
}
- (IBAction)showQuestion:(id)sender {
    // Step to the next question
    self.currentQuestionIndex++;
    
    //Am i past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    // Gets the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    //Display the string in the question label
    self.questionLabel.text = question;
    
    // resets the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender {
    //What is the answer the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //Display it in the answer label
    self.answerLabel.text = answer;
}

@end
