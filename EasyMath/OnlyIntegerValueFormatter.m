//
//  OnlyIntegerValueFormatter.m
//  MyTest2
//
//  Created by Ivaylo Gospodinov on 9/29/21.
//

#import "OnlyIntegerValueFormatter.h"
#import <AppKit/AppKit.h>

@implementation OnlyIntegerValueFormatter
- (BOOL)isPartialStringValid:(NSString*)partialString newEditingString:(NSString**)newString errorDescription:(NSString**)error
{
    //return YES;
    if([partialString length] == 0) {
        return YES;
    }

    int sign = 0;
//    if([partialString characterAtIndex:0] == '-' || [partialString characterAtIndex:0] == '+')
//    {
//        sign = 1;
//        if([partialString length] == 1)
//            return YES;
//    }
    
    NSScanner* scanner = [NSScanner scannerWithString:[partialString substringFromIndex:sign]];

    if(!([scanner scanInt:0] && [scanner isAtEnd])) {
        NSBeep();
        return NO;
    }

    //*newString = [[NSString alloc]initWithString:partialString];
    
    return YES;
}

-(NSString *)stringForObjectValue:(id)obj
{
    return (NSString *)obj;
}

-(BOOL)getObjectValue:(out id  _Nullable __autoreleasing *_Nullable)obj forString:(NSString *)string errorDescription:(out NSString * _Nullable __autoreleasing *_Nullable)error
{
    *obj = string;
    return true;
}

@end
