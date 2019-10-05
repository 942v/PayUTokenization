//
//  PUCreditCardToken.h
//  PayUTokenization
//
//  Created by Guillermo Saenz on 9/28/19.
//

@import Foundation;

#import "PUCreditCardPaymentMethodType.h"

NS_ASSUME_NONNULL_BEGIN

@interface PUCreditCardToken : NSObject

@property (nonatomic, copy, nullable, readonly) NSString *creditCardTokenId;
@property (nonatomic, copy, nullable, readonly) NSString *name;
@property (nonatomic, copy, nullable, readonly) NSString *payerId;
@property (nonatomic, copy, nullable, readonly) NSString *identificationNumber;
@property (nonatomic, assign, readonly) PUCreditCardType paymentMethod;
@property (nonatomic, copy, nullable, readonly) NSString *number;
@property (nonatomic, copy, nullable, readonly) NSString *expirationDate;
@property (nonatomic, copy, nullable, readonly) NSString *creationDate;
@property (nonatomic, copy, nullable, readonly) NSString *maskedNumber;
@property (nonatomic, copy, nullable, readonly) NSString *errorDescription;

+ (instancetype)newWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
