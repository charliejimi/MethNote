//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Charlie on 12/10/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;

-(double)performOperand:(NSString*)operation;
-(void)clearTheOperandStack;

@property (nonatomic,readonly)id program;

+(NSString*)descriptionOfProgram:(id)program;
+(double)runProgram:(id)program;

@end
