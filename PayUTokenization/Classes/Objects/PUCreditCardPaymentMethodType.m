//
//  PUCreditCardPaymentMethodType.m
//  PayUTokenization
//
//  Created by Guillermo Saenz on 10/5/19.
//

#import "PUCreditCardPaymentMethodType.h"

static NSString * const kPUTypeVisa = @"VISA";
static NSString * const kPUTypeMastercard = @"MASTERCARD";
static NSString * const kPUTypeAmex = @"AMEX";
static NSString * const kPUTypeDiners = @"DINERS";

@implementation PUCreditCardPaymentMethodType

+ (PUCreditCardType)paymentMethodTypeFromString:(NSString *)paymentMethodString {
    
    if ([paymentMethodString isEqualToString:kPUTypeVisa]) {
        return PUCreditCardTypeVisa;
    }else if ([paymentMethodString isEqualToString:kPUTypeMastercard]) {
        return PUCreditCardTypeMasterCard;
    }else if ([paymentMethodString isEqualToString:kPUTypeAmex]) {
        return PUCreditCardTypeAmex;
    }else if ([paymentMethodString isEqualToString:kPUTypeDiners]) {
        return PUCreditCardTypeDiners;
    }
    
    return PUCreditCardTypeUnknown;
}

+ (NSString *)paymentMethodStringFromType:(PUCreditCardType)type {
    
    switch (type) {
        case PUCreditCardTypeVisa:
            return kPUTypeVisa;
        case PUCreditCardTypeMasterCard:
            return kPUTypeMastercard;
        case PUCreditCardTypeAmex:
            return kPUTypeAmex;
        case PUCreditCardTypeDiners:
            return kPUTypeDiners;
        default:
            return @"";
    }
}

@end
