//
//  Shiftback.h
//  Calculator
//
//  Created by Charlie  on 12/11/3.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shiftback : NSObject
-(NSString*)toEleminateTheElementInAnInfix:(NSMutableArray*) anInfix;

-(NSString*) toDecideIfToEleminateTheElementInAnInfix:(NSMutableArray*) anInfix;

@end
