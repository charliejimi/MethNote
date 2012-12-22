//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Charlie on 12/10/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
#define pi 3.1415926

@interface CalculatorBrain()

@property (nonatomic,strong)NSMutableArray * programStack;


@end
//@interface CalculatorBrain()
//
//@interface (nonatomic,strong) NSMutableArray*operandStack;
//
//@end

@implementation CalculatorBrain
@synthesize programStack=_programStack;



-(NSMutableArray*)programStack{
    if(_programStack==nil){
        _programStack=[[NSMutableArray alloc]init];
    }
    return _programStack;
}

-(id)program{
    return [self.programStack copy];
}
+(NSString *)descriptionOfProgram:(id)program{
    return @"Implement this in Homework #2";
}

-(void)pushOperand:(double)operand{
       
    
    [self.programStack addObject: [NSNumber numberWithDouble:operand ] ]; //operand];
     //NSLog(@" %@ ",[NSNumber numberWithDouble:operand ]);
    
}

+(double)popOperandOffProgramStack:(NSMutableArray *)stack {
    
//    if ([stack isKindOfClass:[NSMutableArray class]]) {
//        NSLog(@"YES");
//    }
    double result=0;
    //double beChen=0,chen=0;
    
    
    id topOfStack=[stack lastObject];
//    if ((![topOfStack isKindOfClass:[NSNumber class]])&&(![topOfStack isKindOfClass:[NSString class]])) {
//        topOfStack=nil;
//    }
    
    if (topOfStack) {
        [stack removeLastObject];
    }
    
    
    
    if ([topOfStack isKindOfClass:[NSNumber class]]) {
        result=[topOfStack doubleValue];
    }else if([topOfStack isKindOfClass:[NSString class]]){
        
        NSString *operation=topOfStack;
        if([operation isEqualToString:@"+"]){
           
            
            result= [self popOperandOffProgramStack:stack ]+[self popOperandOffProgramStack:stack ];
            
           
            
            //NSLog(@" %f ",result);
            
        }else if([@"x" isEqualToString:operation]){
            result= [self popOperandOffProgramStack:stack ]*[self popOperandOffProgramStack:stack ];
        }else if([@"-" isEqualToString:operation]){
            
            double sub=[self popOperandOffProgramStack:stack ];
            result= [self popOperandOffProgramStack:stack ]-sub;
            
        }else if([@"/" isEqualToString:operation]){
            
            double sub2=[self popOperandOffProgramStack:stack ];
            result= [self popOperandOffProgramStack:stack ]/sub2;
        }else if([@"sin" isEqualToString:operation]){
            result=sin([self popOperandOffProgramStack:stack ]);
        }else if([@"cos" isEqualToString:operation]){
            result=cos([self popOperandOffProgramStack:stack ]);
            
        }else if([@"sqrt" isEqualToString:operation]){
            result=sqrt([self popOperandOffProgramStack:stack ]);
        }else if([@"pi" isEqualToString:operation]){
            result=pi;
            
            [stack addObject: [NSNumber numberWithDouble:pi ] ];
            
            //[self pushOperand:pi]; // To CHECK
            //[self pushOperand:pi];
        }
    }
    
    
    
    return result;
}



-(double)performOperand:(NSString*)operation{
  
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
    
}

+(double)runProgram:(id)program{
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]]){
        stack =[program mutableCopy];
    }
    

    return [self popOperandOffProgramStack:stack];
}


-(void)clearTheOperandStack{
    
    _programStack=nil;
    _programStack=[[NSMutableArray alloc]init];
    
}
@end

