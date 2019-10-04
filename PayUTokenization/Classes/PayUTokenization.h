//
//  Created by Guillermo Saenz on 9/28/19.
//
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    PayUTokenizationLanguageES,
    PayUTokenizationLanguageEN,
    PayUTokenizationLanguagePT,
} PayUTokenizationLanguage;

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

- (void)createTokenWithLanguage:(PayUTokenizationLanguage)language
                        payerId:(NSString *)payerId
                           name:(NSString *)name
                  paymentMethod:(NSString *)paymentMethod
                         number:(NSString *)number
                 expirationDate:(NSDate *)expirationDate
                        success:(void (^_Nullable)(PUCreateTokenResponse *response))success
                        failure:(void (^_Nullable)(NSError *_Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
