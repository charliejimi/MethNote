//
//  transformation.m
//  Calculator
//
//  Created by Charlie  on 12/10/22.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import "transformation.h"

@interface transformation(){
    
}

@property(nonatomic,strong)NSMutableArray *stack;
@property (nonatomic,strong)NSMutableDictionary*opDict;


@end


@implementation transformation
@synthesize stack=_stack;
@synthesize opDict=_opDict;


-(NSMutableArray*)stack{
    if (_stack==nil) {
        _stack=[[NSMutableArray alloc]init];
    }
    return _stack;
}

-(NSMutableDictionary*)opDict{
    if (_opDict==nil) {
        _opDict=[[NSMutableDictionary alloc]init];
        
        [_opDict setObject:[NSNumber numberWithInt:0] forKey:@"("];
        [_opDict setObject:[NSNumber numberWithInt:1] forKey:@"+"];
        [_opDict setObject:[NSNumber numberWithInt:1] forKey:@"-"];
        [_opDict setObject:[NSNumber numberWithInt:2] forKey:@"x"];
        [_opDict setObject:[NSNumber numberWithInt:2] forKey:@"/"];
    }
    
    
    
    return _opDict;
}


-(void) push:(NSString*)item{
    [self.stack addObject:item];
}
//
-(NSString*) pop{
    NSString* topOfStack=[self.stack lastObject];
    if (topOfStack) {
        [self.stack removeLastObject];
    }
    return topOfStack ;
}
//

-(BOOL)IsEmpty{
    return [self.stack count]==0 ? YES:NO;
}

-(NSNumber*)priority:(NSString*)op{

    return [self.opDict objectForKey:op];

}

-(void)fromInfix:(NSMutableArray*)anInfix toPostfix:(NSMutableArray*)aPostfix{

    int indexForInfix=0;
    NSString * elementInfix=nil;
    NSString *topOfStack=nil;
    
    //NSMutableArray *stack=[NSMutableArray new];
    
    
    

    while ( indexForInfix<[anInfix count]) {
        elementInfix=[anInfix objectAtIndex:indexForInfix];
        //NSLog(@" hereerere %@",anInfix);
        if ([elementInfix isEqual:@"("]) {
            // 將x放入堆疊
            [self push:elementInfix];

        }else if([elementInfix isEqual:@")"]){
            // x=自堆疊頂端取出的運算子
            // 將x輸出至後置式中
            while ( (![self IsEmpty]) &&
                (![(topOfStack=[self pop]) isEqual:@"("]) ) {


                [aPostfix addObject:topOfStack];
                // Postfix


            }//while

        }else if([elementInfix isEqual:@"+"]||[elementInfix isEqual:@"-"]||[elementInfix isEqual:@"x"]||[elementInfix isEqual:@"/"]){
            //  /* y = 堆疊頂端的運算子; */
            /* y 的優先序高於x */
            /*
             取出堆疊頂端的運算子並輸出至後置式中;
             y = 堆疊頂端的運算子;
             */

            /*
             將x放入堆疊;
             */
            while([[self priority:[self.stack lastObject]] integerValue]>= [[self priority:elementInfix] integerValue]){
                [aPostfix addObject:[self pop]];
                //Postfix

            }//while
            [self push:elementInfix];
        }else{
           //  x 為運算元
            /* 將x輸出至後置式中;
             */
           [aPostfix addObject:elementInfix];
           
            NSLog(@" Hi %@ ",elementInfix);
            
            //Postfix
        }

        indexForInfix+=1;
    }// while
    while (![self IsEmpty]) {
        [aPostfix addObject:[self pop]];
         // Postfix
    
    }//while

}

@end
