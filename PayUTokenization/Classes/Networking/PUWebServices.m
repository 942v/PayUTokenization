//
//  PUWebServices.m
//  AFNetworking
//
//  Created by Guillermo Saenz on 9/28/19.
//

#import "PUWebServices.h"

#import "PUHTTPSessionManager.h"
#import "PUCreateTokenResponse.h"

@implementation PUWebServices

+ (void)POST_createTokenWithLanguage:(NSString *)language
                            apiLogin:(NSString *)apiLogin
                              apiKey:(NSString *)apiKey
                             payerId:(NSString *)payerId
                                name:(NSString *)name
                       paymentMethod:(NSString *)paymentMethod
                              number:(NSString *)number
                expirationDateString:(NSString *)expirationDateString
                identificationNumber:(NSString *)identificationNumber
                             success:(void (^)(PUCreateTokenResponse * _Nonnull))success
                             failure:(void (^ _Nullable)(NSString * _Nullable, NSError * _Nullable))failure {
    
    NSDictionary *parameters = @{
        @"language":language,
        @"command":@"CREATE_TOKEN",
        @"merchant":[self getMerchantWithApiLogin:apiLogin
                                           apiKey:apiKey],
        @"creditCardToken":[self getCreditCardTokenWithPayerId:payerId
                                                          name:name
                                                 paymentMethod:paymentMethod
                                                        number:number
                                          expirationDateString:expirationDateString
                                          identificationNumber:identificationNumber]
    };
    
    [PUHTTPSessionManager.manager POST:@"service.cgi"
                            parameters:parameters
                              progress:nil
                               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        PUCreateTokenResponse *response = [PUCreateTokenResponse newWithData:responseObject];
        if (response.error) {
            if (failure) failure(response.error, nil);
        }else{
            if (success) success(response);
        }
    }
                               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(nil, error);
    }];
}

#pragma mark - Helpers

+ (NSDictionary *)getMerchantWithApiLogin:(NSString *)apiLogin
                                   apiKey:(NSString *)apiKey {
    return @{
        @"apiLogin":apiLogin,
        @"apiKey":apiKey
    };
}

+ (NSDictionary *)getCreditCardTokenWithPayerId:(NSString *)payerId
                                           name:(NSString *)name
                                  paymentMethod:(NSString *)paymentMethod
                                         number:(NSString *)number
                           expirationDateString:(NSString *)expirationDateString
                           identificationNumber:(NSString *)identificationNumber {
    return @{
        @"payerId":payerId,
        @"name":name,
        @"paymentMethod":paymentMethod,
        @"number":number,
        @"expirationDate":expirationDateString,
        @"identificationNumber":identificationNumber
    };
}

@end
