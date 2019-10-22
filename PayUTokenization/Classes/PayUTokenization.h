//
//  Created by Guillermo Saenz on 9/28/19.
//
//

@import Foundation;

#import "PUCreditCardPaymentMethodType.h"
#import "PULanguage.h"

@class PUCreateTokenResponse;

NS_ASSUME_NONNULL_BEGIN

@interface PayUTokenization : NSObject

/**
 * Creates and returns a singleton instance.
 * @return singleton
 */
+ (PayUTokenization *)sharedInstance;

- (void)setupApiLogin:(NSString *)apiLogin
               apiKey:(NSString *)apiKey;

- (void)createTokenWithLanguage:(PUTokenizationLanguage)language
                        payerId:(NSString *)payerId
                           name:(NSString *)name
                  paymentMethod:(PUCreditCardType)paymentMethod
                         number:(NSString *)number
                 expirationDate:(NSDate *)expirationDate
           identificationNumber:(NSString *)identificationNumber
                        success:(void (^_Nullable)(PUCreateTokenResponse *response))success
                        failure:(void (^_Nullable)(NSError *_Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
