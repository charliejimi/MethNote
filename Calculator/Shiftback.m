//
//  Shiftback.m
//  Calculator
//
//  Created by Charlie  on 12/11/3.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import "Shiftback.h"

@implementation Shiftback
-(NSString*) toEleminateTheElementInAnInfix:(NSMutableArray*) anInfix{
   
    //NSLog(@" in ShiftBack %@",anInfix);
    
    
    
 NSString *myString = [[ NSNumber numberWithDouble:(double) [[anInfix lastObject] doubleValue] ] stringValue];
    NSLog(@"Before  %@",myString);
    NSLog(@" %d ",[myString length]);
   
    
                    myString=[myString stringByReplacingOccurrencesOfString:myString withString:[myString substringToIndex:[myString length]-1]];
    
                    NSLog(@"After hi %@",myString);
            
    return myString;
    
    
}

-(NSString*) toDecideIfToEleminateTheElementInAnInfix:(NSMutableArray*) anInfix{
    
    NSString * aDelta=nil;
    
    if ([[anInfix lastObject] isKindOfClass:[NSNumber class]]) {
        
        aDelta=[[anInfix lastObject] stringValue];
        [anInfix removeLastObject];
        return aDelta;
    }else{
        return @"empty";
    }
    
}

@end
