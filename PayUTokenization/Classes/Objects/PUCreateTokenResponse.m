//
//  PUCreateTokenResponse.m
//  AFNetworking
//
//  Created by Guillermo Saenz on 9/28/19.
//

#import "PUCreateTokenResponse.h"

#import "PUCreditCardToken.h"

@implementation PUCreateTokenResponse

+ (instancetype)newWithData:(NSDictionary *)data {
    
    NSString *code = [data objectForKey:@"code"];
    NSString *error = [data objectForKey:@"error"];
    NSDictionary *creditCardTokenData = [data objectForKey:@"creditCardToken"];
    
    return [[PUCreateTokenResponse alloc] initWithCode:code
                                                 error:error
                                   creditCardTokenData:creditCardTokenData];
}

- (instancetype)initWithCode:(NSString *)code
                       error:(NSString *)error
         creditCardTokenData:(NSDictionary *)creditCardTokenData {
    self = [super init];
    if (self) {
        if ([code isKindOfClass:NSString.class]) _code = code;
        if ([error isKindOfClass:NSString.class]) _error = error;
        if ([creditCardTokenData isKindOfClass:NSDictionary.class]) _creditCardToken = [PUCreditCardToken newWithData:creditCardTokenData];
    }
    return self;
}

@end
