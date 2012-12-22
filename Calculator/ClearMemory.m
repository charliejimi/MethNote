//
//  ClearMemory.m
//  Calculator
//
//  Created by Charlie  on 12/10/27.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import "ClearMemory.h"


@interface ClearMemory(){
    CalculatorBrain* _brain;
}

@end



@implementation ClearMemory
//@synthesize brain=_brain;

-(CalculatorBrain*)brain:(CalculatorBrain*)anAddress{
    if(_brain==nil){
        _brain=[[CalculatorBrain alloc]init];
        //NSLog(@" Here ?? ");
    }
    return _brain;
    
}
-(void)clearStackInTheBrain{
    NSLog(@" clear %p ",_brain);
    [_brain clearTheOperandStack];
    
}

@end
