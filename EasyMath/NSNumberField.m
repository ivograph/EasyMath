//
//  NSNumberField.m
//  EasyMath
//
//  Created by Ivaylo Gospodinov on 10/11/21.
//

#import "NSNumberField.h"

@implementation NSNumberField

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)textDidChange:(NSNotification *)notification{
    [[self currentEditor] moveToBeginningOfLine:0];
}

@end
