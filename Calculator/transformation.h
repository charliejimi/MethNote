//
//  transformation.h
//  Calculator
//
//  Created by Charlie  on 12/10/22.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface transformation : NSObject

-(void)fromInfix:(NSMutableArray*)anInfix toPostfix:(NSMutableArray*)aPostfix;

@end
