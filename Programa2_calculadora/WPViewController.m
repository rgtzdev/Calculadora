//
//  WPViewController.m
//  Programa2_calculadora
//
//  Created by Juan Carrillo Aguirre on 9/8/14.
//  Copyright (c) 2014 gunt_raro. All rights reserved.
//

#import "WPViewController.h"
#import "NSString+NSString_WS.h"

@interface WPViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtOutput;
@property double stateValue;
@property NSString * stateOperator;

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SEL action = @selector(actionButtonNumber:);
    SEL operator = @selector(actionButtonOperator:);
    
    for(UIView * view in [self.view subviews]){
        if([view isKindOfClass:[UIButton class]]){
            UIButton * b = (UIButton *)view;
            if([NSString isNumeric:[b currentTitle]]){
                [b addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            }else{
                [b addTarget:self action:operator forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***
 * actionButtonNumber
 * Method that performs all button number actions
 * @param (id)sender un
 * @return IBAction like... don't know very well XD
 ******************************/
-(IBAction)actionButtonNumber:(id)sender{

    NSString * whatIsOnDisplay = self.txtOutput.text;
    NSString * enteredNumberThatJustEnteredByClickingAButton = [(UIButton *)sender currentTitle];
    
    double a = [whatIsOnDisplay doubleValue];
    double b = [enteredNumberThatJustEnteredByClickingAButton doubleValue];
    
    if(a == 0){
        self.txtOutput.text = [NSString stringWithFormat:@"%g",b];
    }else{
        self.txtOutput.text = [NSString stringWithFormat:@"%g%g",a,b];
    }

}//End of actionButtonNumber Method

/***
 * actionButtonOperator
 * Method that performs all button operator actions
 * @param (id)sender un
 * @return IBAction like... don't know very well XD
 ******************************/
-(IBAction)actionButtonOperator:(id)sender{
    
    NSString * whatIsOnDisplay = self.txtOutput.text;
    NSString * enteredOperatorThatJustEnteredByClickingAButton = [(UIButton *)sender currentTitle];
    
    if ([enteredOperatorThatJustEnteredByClickingAButton isEqual:@"="]){
        
        if([self.stateOperator isEqual:@"+"]){
            self.stateValue += [self.txtOutput.text doubleValue];
            self.txtOutput.text = [NSString stringWithFormat:@"%g",self.stateValue];
        }else if([self.stateOperator isEqual:@"-"]){
            self.stateValue -= [self.txtOutput.text doubleValue];
            self.txtOutput.text = [NSString stringWithFormat:@"%g",self.stateValue];
        }if([self.stateOperator isEqual:@"*"]){
            self.stateValue *= [self.txtOutput.text doubleValue];
            self.txtOutput.text = [NSString stringWithFormat:@"%g",self.stateValue];
        }if([self.stateOperator isEqual:@"/"]){
            self.stateValue /= [self.txtOutput.text doubleValue];
            self.txtOutput.text = [NSString stringWithFormat:@"%g",self.stateValue];
        }if([self.stateOperator isEqual:@"c"]){
            self.stateValue = 0;
            self.txtOutput.text = @"";
        }
        
    }else{
    
        self.stateValue = [whatIsOnDisplay doubleValue];
        self.txtOutput.text = @"";
        self.stateOperator = enteredOperatorThatJustEnteredByClickingAButton;
        
    }
    
}//End of actionButtonOperator Method

@end
