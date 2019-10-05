//
//  PULanguage.m
//  PayUTokenization
//
//  Created by Guillermo Saenz on 10/5/19.
//

#import "PULanguage.h"

static NSString * const kPULanguageEN = @"en";
static NSString * const kPULanguageES = @"es";
static NSString * const kPULanguagePT = @"pt";

@implementation PULanguage

+ (PUTokenizationLanguage)tokenizationLanguageTypeFromString:(NSString *)tokenizationLanguageString {
    
    if ([tokenizationLanguageString isEqualToString:kPULanguageEN]) {
        return PUTokenizationLanguageEN;
    }else if ([tokenizationLanguageString isEqualToString:kPULanguageES]) {
        return PUTokenizationLanguageES;
    }else if ([tokenizationLanguageString isEqualToString:kPULanguagePT]) {
        return PUTokenizationLanguagePT;
    }
    
    return PUTokenizationLanguageUnknown;
}

+ (NSString *)tokenizationLanguageStringFromType:(PUTokenizationLanguage)type {
    
    switch (type) {
        case PUTokenizationLanguageEN:
            return kPULanguageEN;
        case PUTokenizationLanguageES:
            return kPULanguageES;
        case PUTokenizationLanguagePT:
            return kPULanguagePT;
        default:
            return @"";
    }
}

@end
