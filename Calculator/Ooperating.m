//
//  Ooperating.m
//  Calculator
//
//  Created by Charlie  on 12/10/22.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import "Ooperating.h"
#import "CalculatorBrain.h"


@interface Ooperating (){
    
    
}

@property (nonatomic,strong)CalculatorBrain *brain;


@end

@implementation Ooperating
@synthesize brain=_brain;




-(CalculatorBrain*)brain{
    if(_brain==nil){
        _brain=[[CalculatorBrain alloc]init];
        NSLog(@" init %p ",_brain);
        
        
        
    }
    return _brain;
}

-(void)clearTheOperandStack{
    
    NSLog(@" clear ");
    [self.brain clearTheOperandStack];
    NSLog(@" clear!! %p ", self.brain);
}


-(double)postFixCalculate:(NSMutableArray*)postFix{
   
    
     
     NSUInteger indexForPostfix=0;
     id elementInPostfix;
    double result;
    //
     while (indexForPostfix<[postFix count]) {
//     
  elementInPostfix=[postFix objectAtIndex:indexForPostfix];
         //NSLog(@" result= %@ ",postFix);
         
         //
     if ([elementInPostfix isKindOfClass:[NSString class]]) {
     if ( [[elementInPostfix description] isEqualToString:@"+"] || [[elementInPostfix description] isEqualToString:@"-"] ||
     [[elementInPostfix description] isEqualToString:@"x"] || [[elementInPostfix description] isEqualToString:@"/"]){
//     
      result=[self.brain performOperand:elementInPostfix];
//
         
     NSLog(@" claculate!! %p ", self.brain);
//     
//     
//     
     }//if
//     
//     
//     
     }else if([elementInPostfix isKindOfClass:[NSNumber class]]){
//     
//     
     [self.brain pushOperand:[elementInPostfix doubleValue]];
         if ([postFix count]==1) {
             result=[elementInPostfix doubleValue];
             //NSLog(@" result= %@ ",elementInPostfix);
         }
//     
     }// if
     indexForPostfix+=1;
     }//while
//
//     
//     
//     
//     
     
    return result;
    
    
}


@end
