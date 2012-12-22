//
//  ClearMemory.h
//  Calculator
//
//  Created by Charlie  on 12/10/27.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorBrain.h"

@interface ClearMemory : NSObject
//@property (nonatomic,strong) CalculatorBrain* brain;

-(CalculatorBrain*)brain:(CalculatorBrain*)anAddress;

-(void) clearStackInTheBrain;

@end
