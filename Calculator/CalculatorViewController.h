//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Charlie  on 12/10/20.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *screen;


- (IBAction)getButtonPressed:(id)sender;




@end
