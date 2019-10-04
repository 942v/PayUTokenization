//
//  PUWebServices.h
//  AFNetworking
//
//  Created by Guillermo Saenz on 9/28/19.
//

@import Foundation;

@class PUCreateTokenResponse;

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    PUWebServicesLanguageES,
    PUWebServicesLanguageEN,
    PUWebServicesLanguagePT,
} PUWebServicesLanguage;

@interface PUWebServices : NSObject

+ (void)POST_createTokenWithLanguage:(PUWebServicesLanguage)language
                            apiLogin:(NSString *)apiLogin
                              apiKey:(NSString *)apiKey
                             payerId:(NSString *)payerId
                                name:(NSString *)name
                       paymentMethod:(NSString *)paymentMethod
                              number:(NSString *)number
                      expirationDate:(NSDate *)expirationDate
                             success:(void (^_Nullable)(PUCreateTokenResponse *response))success
                             failure:(void (^_Nullable)(NSString *_Nullable errorDescription, NSError *_Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
