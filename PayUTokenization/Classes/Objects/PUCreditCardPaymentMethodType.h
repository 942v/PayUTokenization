//
//  PUCreditCardPaymentMethodType.h
//  PayUTokenization
//
//  Created by Guillermo Saenz on 10/5/19.
//

@import Foundation;

typedef enum : NSUInteger {
    PUCreditCardTypeUnknown,
    PUCreditCardTypeVisa,
    PUCreditCardTypeMasterCard,
    PUCreditCardTypeDiners,
    PUCreditCardTypeAmex
} PUCreditCardType;

NS_ASSUME_NONNULL_BEGIN

@interface PUCreditCardPaymentMethodType : NSObject

+ (PUCreditCardType)paymentMethodTypeFromString:(NSString *)paymentMethodString;
+ (NSString *)paymentMethodStringFromType:(PUCreditCardType)type;

@end

NS_ASSUME_NONNULL_END
