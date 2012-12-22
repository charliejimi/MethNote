//
//  Inserting.m
//  Calculator
//
//  Created by Charlie  on 12/11/3.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import "Inserting.h"

@implementation Inserting

-(void)toInsert:(NSMutableArray*)anOldInfix {
    
    NSUInteger whichOne=0;
    
    @try {
        
        for (;;) {
            
            if ( (( [[anOldInfix objectAtIndex:whichOne] isEqual:@"/"]  )||( [[anOldInfix objectAtIndex:whichOne] isEqual:@"x"]   )) && (( [[anOldInfix objectAtIndex:(whichOne+1)] isEqual:@"+"] )||([[anOldInfix objectAtIndex:(whichOne+1)] isEqual:@"-"] ) ) ) {
               
                [anOldInfix insertObject:@"(" atIndex:(whichOne+1)];
                [anOldInfix insertObject:[NSNumber numberWithInteger:0] atIndex:(whichOne+2)];
                [anOldInfix insertObject:@")" atIndex:(whichOne+5)];
                
            }else if (( [[anOldInfix objectAtIndex:whichOne] isEqual:@"("] )&&(( [[anOldInfix objectAtIndex:(whichOne+1)] isEqual:@"+"]   )||( [[anOldInfix objectAtIndex:(whichOne+1)] isEqual:@"-"]   ))){
               
               [anOldInfix insertObject:[NSNumber numberWithInteger:0] atIndex:(whichOne+1)];
                
                
                
            }// if
           whichOne+=1; 
         }// for(;;)
      }// @try
    @catch (NSException *e) {
        NSLog(@"caught ===> %@ ===> %@", [e name],[e reason]);
        
    }//@catch
    NSLog(@" %@ ",anOldInfix);
    
}


@end
