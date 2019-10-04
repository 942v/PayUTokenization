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

+ (void)POST_createTokenWithLanguage:(PUWebServicesLanguage)language
                            apiLogin:(NSString *)apiLogin
                              apiKey:(NSString *)apiKey
                             payerId:(NSString *)payerId
                                name:(NSString *)name
                       paymentMethod:(NSString *)paymentMethod
                              number:(NSString *)number
                      expirationDate:(NSDate *)expirationDate
                             success:(void (^)(PUCreateTokenResponse * _Nonnull))success
                             failure:(void (^ _Nullable)(NSString * _Nullable, NSError * _Nullable))failure {
    
    NSDictionary *parameters = @{
        @"language":[self languageStringForLanguage:language],
        @"command":@"CREATE_TOKEN",
        @"merchant":[self getMerchantWithApiLogin:apiLogin
                                           apiKey:apiKey],
        @"creditCardToken":[self getCreditCardTokenWithPayerId:payerId
                                                          name:name
                                                 paymentMethod:paymentMethod
                                                        number:number
                                                expirationDate:expirationDate]
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

+ (NSString *)languageStringForLanguage:(PUWebServicesLanguage)language {
    switch (language) {
        case PUWebServicesLanguageEN:
            return @"en";
        case PUWebServicesLanguageES:
            return @"es";
        case PUWebServicesLanguagePT:
            return @"pt";
    }
}

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
                                 expirationDate:(NSDate *)expirationDate {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"YYYY/MM";
    dateFormatter.timeZone = nil;
    return @{
        @"payerId":payerId,
        @"name":name,
        @"paymentMethod":paymentMethod,
        @"number":number,
        @"expirationDate":[dateFormatter stringFromDate:expirationDate]
    };
}

@end
