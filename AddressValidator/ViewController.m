//
//  ViewController.m
//  AddressValidator
//
//  Created by Jonathan Fox on 4/22/15.
//  Copyright (c) 2015 Jon Fox. All rights reserved.
//

#import "ViewController.h"
#import "ZipCodeValidator.h"
#import "PatternValidator.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (nonatomic) ZipCodeValidator *zipCodeValidator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addressTextField.delegate = self;
    self.zipCodeValidator = [ZipCodeValidator new];
}


-(void)textFieldDidEndEditing:(UITextField *)textField {
    BOOL didValidate = [PatternValidator validateZipCodeWithString:textField.text];
    if (didValidate == NO) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OOPS!" message:@"Please use proper US or Canadian format." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL shouldReplace = [self.zipCodeValidator shouldReplaceUsingString:string andTextField:textField.text];
    if ([string isEqualToString:@""]){
        shouldReplace = YES;
    }else if (textField.text.length > 0) {
        [self autoInsertDashIfNeededUsingTextField:textField];
        [self autoInsertSpaceIfNeededUsingTextField:textField];
    }
    return shouldReplace;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - HELPERS

-(void)autoInsertDashIfNeededUsingTextField:(UITextField *)textField {
    NSString *firstCharacter = [textField.text substringToIndex:1];
    BOOL didValidateNumber = [PatternValidator validateNumbersWithString:firstCharacter];
    if (didValidateNumber == YES) {
        if (textField.text.length == 5) {
            textField.text = [textField.text stringByAppendingString:@"-"];
        }
    }
}

-(void)autoInsertSpaceIfNeededUsingTextField:(UITextField *)textField {
    NSString *firstCharacter = [textField.text substringToIndex:1];
    BOOL didValidateAlpha = [PatternValidator validateLettersWithString:firstCharacter];
    if (didValidateAlpha == YES) {
        if (textField.text.length == 3) {
            textField.text = [textField.text stringByAppendingString:@" "];
        }
    }
}

@end
