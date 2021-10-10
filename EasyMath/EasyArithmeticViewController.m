//
//  EasyArithmeticViewController.m
//  EasyMath
//
//  Created by Ivaylo Gospodinov on 10/9/21.
//

#import "EasyArithmeticViewController.h"
#import "OnlyIntegerValueFormatter.h"
#import "VirtualPointView.h"
#import "NSNumberField.h"

#include <stdlib.h>

@interface EasyArithmeticViewController()
@property (weak) IBOutlet NSTextField *lblLHS;
@property (weak) IBOutlet NSTextField *lblOperation;
@property (weak) IBOutlet NSTextField *lblRHS;
@property (weak) IBOutlet NSTextField *lblResult;
@property (weak) IBOutlet NSTextField *lblTaskSucceeded;
@property (weak) IBOutlet NSTextField *lblTaskFailed;

@property (weak) IBOutlet NSProgressIndicator *taskProgres;
@property (weak) IBOutlet VirtualPointView *virtPtTen;
@property (weak) IBOutlet VirtualPointView *virtPtHundred;


@property (assign) int taskSucceeded;
@property (assign) int taskTotal;
@property (assign) int timerSuspend;
@end

@implementation EasyArithmeticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.taskTotal = 0;
    self.taskSucceeded = 0;
    self.timerSuspend = NO;

    [self createNewTask];

    OnlyIntegerValueFormatter *formatter = [[OnlyIntegerValueFormatter alloc] init];
    //formatter.usesSignificantDigits = NO;
//    [formatter setPositivePrefix:[formatter plusSign]];
 //   [formatter setNegativePrefix:[formatter minusSign]];
    [self.lblResult setFormatter:formatter];
    self.lblResult.delegate  = self;
    
    //[self.lblResult setBaseWritingDirection:NSWritingDirectionRightToLeft];
    self.lblResult.baseWritingDirection = NSWritingDirectionRightToLeft;

    [self.taskProgres setMinValue:0];
    [self.taskProgres setMaxValue:300];
//    [self.taskProgres set:60];

    [NSTimer scheduledTimerWithTimeInterval:1.0
             target:self
             selector:@selector(taskTimeIncrement)
             userInfo:nil
             repeats:YES];
}


-(void) controlTextDidChange:(NSNotification *) notification{
    NSTextField *textField = [notification object];
    if(textField==_lblResult)
    {

        NSString* val = [textField stringValue];
        if([val length]>0)
        {
            NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
            f.numberStyle = NSNumberFormatterDecimalStyle;
            NSNumber *myNumber = [f numberFromString:val];

            if(myNumber)
            {
                long res = [myNumber integerValue];
                long lhs = [self.lblLHS integerValue];
                long rhs = [self.lblRHS integerValue];


                NSString* operation = [self.lblOperation stringValue];
                CGColorRef color;

                BOOL correct = false;
                if([operation compare: @"+"] == 0)
                {
                    correct = (lhs+rhs == res);
                }
                else// if ([operation compare: @"-"] == 0)
                {
                    correct = (lhs-rhs == res);
                }

                if(correct)
                {
                    color = CGColorCreateGenericRGB(0.0 ,1.0, 0.0, 1.0);
                    self.taskSucceeded++;

                    self.timerSuspend = YES;

                    [NSTimer scheduledTimerWithTimeInterval:3.0
                             target:self
                             selector:@selector(createNewTask)
                             userInfo:nil
                             repeats:NO];

                }
                else
                {
                    color = CGColorCreateGenericRGB(1.0 ,0.0, 0.0, 1.0);
                }

                self.lblResult.wantsLayer = YES;
                self.lblResult.layer.borderColor = color;
                self.lblResult.layer.borderWidth = 5;
                self.lblResult.bordered = YES;
            }
            [[self.lblResult currentEditor] moveToBeginningOfLine:0];
        }
        else
        {
            self.lblResult.wantsLayer = YES;
            self.lblResult.bordered = NO;
            self.lblResult.layer.borderWidth = 0;
        }


    }
}

-(void) createNewTask{

    [self.taskProgres setDoubleValue:0];

    int lhs = arc4random_uniform(99);
    int rhs = arc4random_uniform(100-lhs);

    int op = arc4random_uniform(2);

    if(op==0)
    {
        [self.lblOperation  setStringValue:@"-"];
        rhs = arc4random_uniform(lhs);
    }
    else
    {
        [self.lblOperation  setStringValue:@"+"];
    }

    [self.lblLHS  setStringValue:[NSString stringWithFormat:@"%d", lhs]];

    [self.lblRHS  setStringValue:[NSString stringWithFormat:@"%d", rhs]];
    [self.lblResult  setStringValue:@""];

    [self.lblTaskSucceeded setIntValue:self.taskSucceeded];
    [self.lblTaskFailed setIntValue:(self.taskTotal - self.taskSucceeded)];
    
    [self.virtPtTen reset];
    [self.virtPtHundred reset];

    self.taskTotal++;

    self.timerSuspend = NO;

}

-(void)taskTimeIncrement{
    if(!self.timerSuspend)
    {
        if([self.taskProgres doubleValue]>=[self.taskProgres maxValue])
        {
            [self createNewTask];
        }
        [self.taskProgres incrementBy:1];
    }
}
@end
