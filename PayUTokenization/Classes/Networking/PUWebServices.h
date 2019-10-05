//
//  PUWebServices.h
//  AFNetworking
//
//  Created by Guillermo Saenz on 9/28/19.
//

@import Foundation;

@class PUCreateTokenResponse;

NS_ASSUME_NONNULL_BEGIN

@interface PUWebServices : NSObject

+ (void)POST_createTokenWithLanguage:(NSString *)language
                            apiLogin:(NSString *)apiLogin
                              apiKey:(NSString *)apiKey
                             payerId:(NSString *)payerId
                                name:(NSString *)name
                       paymentMethod:(NSString *)paymentMethod
                              number:(NSString *)number
                expirationDateString:(NSString *)expirationDateString
                             success:(void (^_Nullable)(PUCreateTokenResponse *response))success
                             failure:(void (^_Nullable)(NSString *_Nullable errorDescription, NSError *_Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
