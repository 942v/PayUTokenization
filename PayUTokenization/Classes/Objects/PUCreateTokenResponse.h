//
//  PUCreateTokenResponse.h
//  AFNetworking
//
//  Created by Guillermo Saenz on 9/28/19.
//

@import Foundation;

@class PUCreditCardToken;

NS_ASSUME_NONNULL_BEGIN

@interface PUCreateTokenResponse : NSObject

@property (nonatomic, copy, nullable) NSString *code;
@property (nonatomic, copy, nullable) NSString *error;
@property (nonatomic, copy, nullable) PUCreditCardToken *creditCardToken;

+ (instancetype)newWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
