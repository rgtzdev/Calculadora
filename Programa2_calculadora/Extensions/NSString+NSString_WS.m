//
//  NSString+NSString_WS.m
//  Programa2_calculadora
//
//  Created by Ramiro Gutierrez on 09/09/14.
//  Copyright (c) 2014 gunt_raro. All rights reserved.
//

#import "NSString+NSString_WS.h"

@implementation NSString (NSString_WS)

+(BOOL)isNumeric:(NSString *)res{

    BOOL valid;
    
    NSCharacterSet * numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet * compar = [NSCharacterSet characterSetWithCharactersInString:res];
    
    valid = [numbers isSupersetOfSet:compar];
    
    return valid;
    
}//End of isNumeric Method

@end
