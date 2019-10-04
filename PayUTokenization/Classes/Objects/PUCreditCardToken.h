//
//  PUCreditCardToken.h
//  PayUTokenization
//
//  Created by Guillermo Saenz on 9/28/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PUCreditCardToken : NSObject

@property (nonatomic, copy, nullable) NSString *creditCardTokenId;
@property (nonatomic, copy, nullable) NSString *name;
@property (nonatomic, copy, nullable) NSString *payerId;
@property (nonatomic, copy, nullable) NSString *identificationNumber;
@property (nonatomic, copy, nullable) NSString *paymentMethod;
@property (nonatomic, copy, nullable) NSString *number;
@property (nonatomic, copy, nullable) NSString *expirationDate;
@property (nonatomic, copy, nullable) NSString *creationDate;
@property (nonatomic, copy, nullable) NSString *maskedNumber;
@property (nonatomic, copy, nullable) NSString *errorDescription;

+ (instancetype)newWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
