//
//  ViewController.m
//  СurrencyExchanger
//
//  Created by Vlad Burak on 17.03.2021.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest * req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *covertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;


@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    // self - ссылка на этот объект
    self.covertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start]; // для того чтобы выйти в интернет и получить данные

    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.covertButton.enabled = YES;
    
    double InputValue = [self.inputField.text floatValue];
    double PlnValue = InputValue * currencies.PLN;
    NSString * temp = [NSString stringWithFormat:@"%.2f", PlnValue ];
    self.currencyA.text = temp;
    
    double GBPVlaue = InputValue * currencies.GBP;
    NSString * temp2 = [NSString stringWithFormat:@"%.2f", GBPVlaue ];
    self.currencyB.text = temp2;
    
    double EURVlaue = InputValue * currencies.EUR;
    NSString * temp3 = [NSString stringWithFormat:@"%.2f", EURVlaue ];
    self.currencyC.text = temp3;
    
    
}


@end
