//
//  PatternValidator.h
//  AddressValidator
//
//  Created by Jonathan Fox on 4/26/15.
//  Copyright (c) 2015 Jon Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PatternValidator : NSObject

+(BOOL)validateZipCodeWithString:(NSString *)string;
+(BOOL)validateNumbersWithString:(NSString *)string;
+(BOOL)validateLettersWithString:(NSString *)string;

@end
