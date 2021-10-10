//
//  AdvanceArithmeticViewController.h
//  EasyMath
//
//  Created by Ivaylo Gospodinov on 10/9/21.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdvanceArithmeticViewController : NSViewController<NSTextViewDelegate, NSTextFieldDelegate>

-(void) controlTextDidChange:(NSNotification *)notification;

-(void) createNewTask;
-(void)taskTimeIncrement;
@end

NS_ASSUME_NONNULL_END
