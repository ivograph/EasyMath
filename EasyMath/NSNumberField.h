//
//  NSNumberField.h
//  EasyMath
//
//  Created by Ivaylo Gospodinov on 10/11/21.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumberField : NSTextField
-(void)textDidChange:(NSNotification *)notification;
@end

NS_ASSUME_NONNULL_END
