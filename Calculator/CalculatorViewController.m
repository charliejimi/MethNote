//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Charlie  on 12/10/20.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import "CalculatorViewController.h"
#import "transformation.h"
#import "Ooperating.h"
#import "Inserting.h"
#import "Shiftback.h"
#import "MyPaletteViewController.h"



@interface CalculatorViewController (){
    
    
}

@property (strong,nonatomic) MyPaletteViewController *myPaletteViewController;

@property (nonatomic)BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic,strong) NSMutableArray* inFix;
@property (nonatomic,strong) NSMutableArray* postFix;
@property (nonatomic,strong) transformation*trans;

@property (nonatomic,strong)
Ooperating *operateCalculator;

@property (nonatomic,strong)NSNumber*top;
@property (nonatomic,strong) NSMutableArray* copyANumber;



@property (nonatomic,strong) NSString* delta;
@property (nonatomic) BOOL closingParenthese;
@property (nonatomic,strong) Inserting*inserting;
@property (nonatomic) NSUInteger iCount;
@property (nonatomic,strong) Shiftback* shift;


@end

@implementation CalculatorViewController

@synthesize myPaletteViewController=_myPaletteViewController;

@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize inFix=_inFix;
@synthesize postFix=_postFix;

@synthesize operateCalculator=_operateCalculator;


@synthesize display;

@synthesize trans=_trans;
@synthesize screen=_screen;
@synthesize copyANumber=_copyANumber;
@synthesize delta=_delta;
@synthesize closingParenthese=_closingParenthese;
@synthesize inserting=_inserting;
@synthesize iCount=_iCount;
@synthesize shift=_shift;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // 另外一種方式
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"kawa6.png"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
}


-(MyPaletteViewController*)myPaletteViewController{
    if (_myPaletteViewController==nil) {
        _myPaletteViewController=[[MyPaletteViewController alloc]initWithNibName:@"MyPaletteViewController" bundle: nil];
        
       
    }
    return _myPaletteViewController;
}



-(Shiftback*)shift{
    if (_shift==nil) {
        _shift=[[Shiftback alloc]init];
    }
    return _shift;
}

-(NSUInteger)iCount{
           
    return _iCount;
}


-(Inserting*)inserting{
    if (_inserting==nil) {
        _inserting=[[Inserting alloc]init];
    }
    return _inserting;
}

-(BOOL)closingParenthese{
    if (_closingParenthese==NO) {
        _closingParenthese=NO;
    }
    return _closingParenthese;
}

-(NSString*)delta{
    if (_delta==nil) {
        _delta=@"empty";
        
    }
    return _delta;
}



-(NSMutableArray*)copyANumber{
    if (_copyANumber==nil) {
        _copyANumber=[[NSMutableArray alloc]init];
    }
    return _copyANumber;
}
-(transformation*)trans{
    if (_trans==nil) {
        _trans=[[transformation alloc]init];
    }
    return _trans;
}

-(Ooperating*)operateCalculator{
    if(_operateCalculator==nil){
        _operateCalculator=[[Ooperating alloc]init];
    }
    return _operateCalculator;
    
}
-(NSMutableArray*)inFix{
    if(_inFix==nil){
        _inFix=[[NSMutableArray alloc]init];
    }
    return _inFix;
}
-(NSMutableArray*)postFix{
    if(_postFix==nil){
        _postFix=[[NSMutableArray alloc]init];
    }
    return _postFix;
}

- (IBAction)digitPressed:(UIButton*)sender {
   
    
    NSString *digit=sender.currentTitle;
    //NSUInteger iCount=0;
    
    
    if([digit isEqualToString:@"."]){
        self.iCount+=1;
    }
    if ((![digit isEqual:@"."])||self.iCount<2) {
        NSLog(@"grrrrr %d",self.iCount);
        if (self.userIsInTheMiddleOfEnteringANumber) {
            
            
            self.display.text=[self.display.text stringByAppendingString:digit];
        }else {
            
            self.display.text=digit;
            self.userIsInTheMiddleOfEnteringANumber=YES;
            
        }//if
        
        
        NSLog(@" 1=> %@ ",self.delta);
        if ([self.delta isEqualToString:@"empty"]) {
            self.delta=digit;
            //NSLog(@"%@",self.delta);
        }else if(![self.delta isEqualToString:@"empty"]){
            self.delta=[self.delta stringByAppendingString:digit];
            
        }// if
  
    }// if ((![digit isEqual:@"."])||self.iCount<2)
         
    
}

- (IBAction)operationPressed:(UIButton*)sender {
    
    NSString *operation=sender.currentTitle;
    
    self.iCount=0;
    
    
    if ([self.delta isEqualToString:@"empty"]) {
        //do nothing
    }else if(![self.delta isEqualToString:@"empty"]){
        
       [self.inFix addObject:[ NSNumber numberWithDouble:[self.delta doubleValue] ] ];
        
       //  [self.inFix addObject:@"2.0"];
        
        
        NSLog(@"self.delta => hi %f",[self.delta doubleValue]);
        NSLog(@"self.inFix= > hi %@",self.inFix);
              
           //   [ NS numberWithLong:[self.delta doubleValue] ] );
        
        self.delta=@"empty";
        
    }
    
    
    
    
    
    if (self.userIsInTheMiddleOfEnteringANumber) {
                
        self.display.text=[self.display.text stringByAppendingString:operation];
    }else{
                
        self.display.text=operation;
        self.userIsInTheMiddleOfEnteringANumber=YES;
        
    }
    
    
     [self.inFix addObject:operation];
}

- (IBAction)back:(id)sender {
    
    
    @try {
        if ([[self.display.text substringWithRange:NSMakeRange(([self.display.text length]-1), 1)] isEqualToString:@"."]) {
            self.iCount=0;
        }//if
        
        
        
        
        
        if (![self.delta isEqualToString:@"empty"]) {
            self.delta=[self.delta stringByReplacingOccurrencesOfString:self.delta withString:[self.delta substringToIndex:[self.delta length]-1]];
            if (![self.delta length]) {
                self.delta=@"empty";
            }// if(![self.delta length])
        }else{
            
            NSLog(@"%@",self.inFix);
            
            if ([[self.inFix lastObject] isKindOfClass:[NSNumber class]]) {
                
                //NSLog(@"before shift back %@",self.inFix);
                
                self.delta =[self.shift  toEleminateTheElementInAnInfix:self.inFix];
                
                
                
                [self.inFix removeLastObject];
                
                
                
                //NSLog(@"After subroutine %@",self.delta);
                
            }else{
                //NSLog(@"before shift back %@",self.inFix);
                [self.inFix removeLastObject];
                
                self.delta =[self.shift  toDecideIfToEleminateTheElementInAnInfix:self.inFix];
                
               
            }// if ([[self.inFix lastObject] isKindOfClass:[NSNumber class]])
            
        }// if (![self.delta isEqualToString:@"empty"])
        
        
        self.display.text=[self.display.text stringByReplacingOccurrencesOfString:self.display.text withString:[self.display.text substringToIndex:[self.display.text length]-1]];
        if (![self.display.text length]) {
            self.display.text=@" ";
        }// if(![self.display.text length])    
        
        //NSLog(@" %@ ",self.display.text);
    }
    @catch (NSException *e) {
        NSLog(@"caught ===> %@ ===> %@", [e name],[e reason]);
    }
    
    
    
}


- (IBAction)clearAll:(id)sender {
    
    self.iCount=0;
    self.display.text=@" ";
    self.screen.text=@" ";
    
    self.delta=@"empty";
    self.inFix=nil;
    self.postFix=nil;
    [self.operateCalculator clearTheOperandStack];
    
    
}


- (IBAction)check:(id)sender {
    self.iCount=0;
    
    
    if ([self.delta isEqualToString:@"empty"]) {
        //do nothing
    }else if(![self.delta isEqualToString:@"empty"]){
        [self.inFix addObject:[ NSNumber numberWithDouble:[self.delta doubleValue] ] ];
      //  NSLog(@" here we are!! %@ ",self.inFix);
        self.delta=@"empty";
    }
    //NSLog(@" in the infix %@ ",self.inFix);
    
    
    NSString *resultStr=nil;
    self.userIsInTheMiddleOfEnteringANumber=NO;
    //NSLog(@" anInfix! %@ ",self.inFix);
    if ( [self.inFix count]) {
        [self.inserting toInsert:self.inFix];
        
        //NSLog(@" anInfix! %@ ",self.inFix);
        
        [self.trans fromInfix:self.inFix toPostfix:self.postFix];
        
        //NSLog(@" here we are!! %@ ",self.postFix);
        
        resultStr=[NSString stringWithFormat:@"%.4f",[self.operateCalculator postFixCalculate:self.postFix]];
        
        NSLog(@" helloooo %@ ", resultStr);
        self.screen.text=resultStr;
    }
 
    
    self.delta=@"empty";
    self.inFix=nil;
    self.postFix=nil;
    [self.operateCalculator clearTheOperandStack];

    
     
}


- (void)viewDidUnload {
    [self setScreen:nil];
    [super viewDidUnload];
}
- (IBAction)getButtonPressed:(id)sender {
    
     
    NSLog(@" %p ",self.myPaletteViewController);
    
    //轉場效果
        self.myPaletteViewController.modalTransitionStyle=UIModalTransitionStylePartialCurl;
    
      [self presentViewController:self.myPaletteViewController animated:YES completion:nil];
    
}
@end
