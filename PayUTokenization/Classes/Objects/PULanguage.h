//
//  PULanguage.h
//  PayUTokenization
//
//  Created by Guillermo Saenz on 10/5/19.
//

@import Foundation;

typedef enum : NSUInteger {
    PUTokenizationLanguageUnknown,
    PUTokenizationLanguageES,
    PUTokenizationLanguageEN,
    PUTokenizationLanguagePT
} PUTokenizationLanguage;

NS_ASSUME_NONNULL_BEGIN

@interface PULanguage : NSObject

+ (PUTokenizationLanguage)tokenizationLanguageTypeFromString:(NSString *)tokenizationLanguageString;
+ (NSString *)tokenizationLanguageStringFromType:(PUTokenizationLanguage)type;

@end

NS_ASSUME_NONNULL_END
