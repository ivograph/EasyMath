//
//  OnlyIntegerValueFormatter.h
//  MyTest2
//
//  Created by Ivaylo Gospodinov on 9/29/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OnlyIntegerValueFormatter : NSFormatter//NSNumberFormatter
- (BOOL)isPartialStringValid:(NSString*)partialString newEditingString:(NSString*_Nullable*_Nullable)newString errorDescription:(NSString*_Nullable*_Nullable)error;

-(NSString *)stringForObjectValue:(id)obj;
-(BOOL)getObjectValue:(out id  _Nullable __autoreleasing *_Nullable)obj forString:(NSString *)string errorDescription:(out NSString * _Nullable __autoreleasing *_Nullable)error;
@end

NS_ASSUME_NONNULL_END
