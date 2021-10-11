//
//  ArithmeticTaskStatusViewControler.m
//  EasyMath
//
//  Created by Ivaylo Gospodinov on 10/11/21.
//

#import "ArithmeticTaskStatusViewControler.h"

@interface ArithmeticTaskStatusViewControler ()
@property (weak) IBOutlet NSTextField *lblTaskSucceeded;
@property (weak) IBOutlet NSTextField *lblTaskFailed;
@property (weak) IBOutlet NSProgressIndicator *taskProgres;
@end

@implementation ArithmeticTaskStatusViewControler

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.taskProgres setMinValue:0];
    [self.taskProgres setMaxValue:300];

//    [NSTimer scheduledTimerWithTimeInterval:1.0
//             target:self
//             selector:@selector(taskTimeIncrement)
//             userInfo:nil
//             repeats:YES];
}

-(void)Setup {
    NSLog(@"1234");
}
@end
