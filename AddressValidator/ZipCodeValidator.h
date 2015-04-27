//
//  ZipCodeValidator.h
//  AddressValidator
//
//  Created by Jonathan Fox on 4/26/15.
//  Copyright (c) 2015 Jon Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZipCodeValidator : NSObject

-(BOOL)shouldReplaceUsingString:(NSString *)string andTextField:(NSString *)text;

@end
