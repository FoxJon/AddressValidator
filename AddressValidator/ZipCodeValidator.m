//
//  zipCodeValidator.m
//  AddressValidator
//
//  Created by Jonathan Fox on 4/26/15.
//  Copyright (c) 2015 Jon Fox. All rights reserved.
//

#import "ZipCodeValidator.h"
#import "PatternValidator.h"


@implementation ZipCodeValidator

-(BOOL)shouldReplaceUsingString:(NSString *)string andTextField:(NSString *)text{
    BOOL shouldReplace = YES;
    BOOL didValidateNumString = [PatternValidator validateNumbersWithString:string];
    BOOL didValidateAlphaString = [PatternValidator validateLettersWithString:string];
    if (didValidateNumString == NO && didValidateAlphaString == NO) shouldReplace = NO;
    
    if (text.length > 0) {
        NSString *firstCharacter = [text substringToIndex:1];
        
        BOOL didValidateNumber = [PatternValidator validateNumbersWithString:firstCharacter];
        if (didValidateNumber == YES) {
            BOOL didValidateString = [PatternValidator validateNumbersWithString:string];
            if (didValidateString == NO) {
                shouldReplace = NO;
            }
            if (text.length > 9) shouldReplace = NO;
        }
        
        BOOL didValidateLetter = [PatternValidator validateLettersWithString:firstCharacter];
        if (didValidateLetter == YES) {
            switch (text.length)
            {
                case 1:
                case 4:
                case 6:
                    if (didValidateNumString == NO) {
                        shouldReplace = NO;
                    }
                    break;
                case 2:
                case 3:
                case 5:
                    if (didValidateAlphaString == NO) {
                        shouldReplace = NO;
                    }
                    break;
                default:
                    break;
            }
            if (text.length > 6) shouldReplace = NO;
        }
    }
    return shouldReplace;
}


@end
