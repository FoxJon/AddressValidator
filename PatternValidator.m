//
//  PatternValidator.m
//  AddressValidator
//
//  Created by Jonathan Fox on 4/26/15.
//  Copyright (c) 2015 Jon Fox. All rights reserved.
//

#import "PatternValidator.h"

#define kUSCanadaZipCodePattern @"(^\\d{5}(-\\d{4})?$)|(^[ABCEGHJKLMNPRSTVXY]\\d[A-Z][- ]*\\d[A-Z]\\d$)"
#define knumbers @"\\d"
#define kalpha @"[A-Z]"

@implementation PatternValidator

+(BOOL)validateZipCodeWithString:(NSString *)string{
    BOOL didValidate = [self validateString:string withPattern:kUSCanadaZipCodePattern];
    return didValidate;
}

+(BOOL)validateNumbersWithString:(NSString *)string{
    BOOL didValidate = [self validateString:string withPattern:knumbers];
    return didValidate;
}

+(BOOL)validateLettersWithString:(NSString *)string{
    BOOL didValidate = [self validateString:string withPattern:kalpha];
    return didValidate;
}


#pragma mark - HELPER


+(BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSAssert(regex, @"Unable to create regular expression");
    
    NSRange textRange = NSMakeRange(0, string.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:string options:NSMatchingReportProgress range:textRange];
    
    BOOL didValidate = NO;
    
    if (matchRange.location != NSNotFound)
        didValidate = YES;
    
    return didValidate;
}

@end
