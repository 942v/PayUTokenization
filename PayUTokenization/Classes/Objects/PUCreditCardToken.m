//
//  PUCreditCardToken.m
//  PayUTokenization
//
//  Created by Guillermo Saenz on 9/28/19.
//

#import "PUCreditCardToken.h"

@interface PUCreditCardToken ()

@property (nonatomic, copy, nullable) NSString *paymentMethodString;

@end

@implementation PUCreditCardToken

+ (instancetype)newWithData:(NSDictionary *)data {
    
    NSString *creditCardTokenId = [data objectForKey:@"creditCardTokenId"];
    NSString *name = [data objectForKey:@"name"];
    NSString *payerId = [data objectForKey:@"payerId"];
    NSString *identificationNumber = [data objectForKey:@"identificationNumber"];
    NSString *paymentMethod = [data objectForKey:@"paymentMethod"];
    NSString *number = [data objectForKey:@"number"];
    NSString *expirationDate = [data objectForKey:@"expirationDate"];
    NSString *creationDate = [data objectForKey:@"creationDate"];
    NSString *maskedNumber = [data objectForKey:@"maskedNumber"];
    NSString *errorDescription = [data objectForKey:@"errorDescription"];
    
    return [[PUCreditCardToken alloc] initWithCreditCardTokenId:creditCardTokenId
                                                           name:name
                                                        payerId:payerId
                                           identificationNumber:identificationNumber
                                                  paymentMethod:paymentMethod
                                                         number:number
                                                 expirationDate:expirationDate
                                                   creationDate:creationDate
                                                   maskedNumber:maskedNumber
                                               errorDescription:errorDescription];
}

- (instancetype)initWithCreditCardTokenId:(NSString *)creditCardTokenId
                                     name:(NSString *)name
                                  payerId:(NSString *)payerId
                     identificationNumber:(NSString *)identificationNumber
                            paymentMethod:(NSString *)paymentMethod
                                   number:(NSString *)number
                           expirationDate:(NSString *)expirationDate
                             creationDate:(NSString *)creationDate
                             maskedNumber:(NSString *)maskedNumber
                         errorDescription:(NSString *)errorDescription {
    self = [super init];
    if (self) {
        if ([creditCardTokenId isKindOfClass:NSString.class]) _creditCardTokenId = creditCardTokenId;
        if ([name isKindOfClass:NSString.class]) _name = name;
        if ([payerId isKindOfClass:NSString.class]) _payerId = payerId;
        if ([identificationNumber isKindOfClass:NSString.class]) _identificationNumber = identificationNumber;
        if ([paymentMethod isKindOfClass:NSString.class]) self.paymentMethodString = paymentMethod;
        if ([number isKindOfClass:NSString.class]) _number = number;
        if ([expirationDate isKindOfClass:NSString.class]) _expirationDate = expirationDate;
        if ([creationDate isKindOfClass:NSString.class]) _creationDate = creationDate;
        if ([maskedNumber isKindOfClass:NSString.class]) _maskedNumber = maskedNumber;
        if ([errorDescription isKindOfClass:NSString.class]) _errorDescription = errorDescription;
    }
    return self;
}

- (void)setPaymentMethodString:(NSString *)paymentMethodString {
    _paymentMethodString = paymentMethodString;
    
    _paymentMethod = [PUCreditCardPaymentMethodType paymentMethodTypeFromString:paymentMethodString];
}

@end
