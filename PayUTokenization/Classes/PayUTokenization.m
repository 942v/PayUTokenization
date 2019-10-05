//
//  Created by Guillermo Saenz on 9/28/19.
//
//

#import "PayUTokenization.h"

#import "PUHTTPSessionManager.h"
#import "PUWebServices.h"

@interface PayUTokenization ()

@property (nonatomic, strong) NSString *apiLogin;
@property (nonatomic, strong) NSString *apiKey;

@end

@implementation PayUTokenization

static NSString *PayUTokenizationBaseURLString = @"https://sandbox.api.payulatam.com/payments-api/4.0";

#pragma mark - Creating a singleton instance

+ (instancetype)sharedInstance {
    static dispatch_once_t _onceToken;
    static id _sharedInstance;
    dispatch_once(&_onceToken, ^{
        _sharedInstance = [[[self class] alloc] initSingleton];
    });
    return _sharedInstance;
}

- (instancetype)initSingleton {
    self = [super init];
    if (self) {
        [PUHTTPSessionManager initWithBaseURLString:PayUTokenizationBaseURLString];
    }
    return self;
}

- (instancetype)init {
    @throw [[self class] initException];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    @throw [[self class] initException];
}

#pragma mark - Init Exception

+ (NSException *)initException {
    NSString *exceptionMessage = [NSString stringWithFormat:@"'%@' is a Singleton, you must NOT call init manually! Use +sharedInstance instead.", [self class]];
    return [NSException exceptionWithName:NSInternalInconsistencyException reason:exceptionMessage userInfo:nil];
}

- (void)setupApiLogin:(NSString *)apiLogin
               apiKey:(NSString *)apiKey {
    
    _apiLogin = apiLogin;
    _apiKey = apiKey;
}

- (void)checkForKeys {
    
    NSAssert(self.apiKey || self.apiLogin, @"You need to provide apikey and apilogin first");
}

- (void)createTokenWithLanguage:(PUTokenizationLanguage)language
                        payerId:(NSString *)payerId
                           name:(NSString *)name
                  paymentMethod:(PUCreditCardType)paymentMethod
                         number:(NSString *)number
                 expirationDate:(NSDate *)expirationDate
                        success:(void (^)(PUCreateTokenResponse * _Nonnull))success
                        failure:(void (^)(NSError * _Nullable))failure {
    
    [self checkForKeys];
    
    [PUWebServices POST_createTokenWithLanguage:[PULanguage tokenizationLanguageStringFromType:language]
                                       apiLogin:self.apiLogin
                                         apiKey:self.apiKey
                                        payerId:payerId
                                           name:name
                                  paymentMethod:[PUCreditCardPaymentMethodType paymentMethodStringFromType:paymentMethod]
                                         number:number
                           expirationDateString:[PayUTokenization dateStringFromDate:expirationDate]
                                        success:^(PUCreateTokenResponse * _Nonnull response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) success(response);
        });
    } failure:^(NSString * _Nullable errorDescription, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (failure) failure(error);
        });
    }];
}

#pragma mark - Helpers

+ (NSString *)dateStringFromDate:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"YYYY/MM";
    dateFormatter.timeZone = nil;
    return [dateFormatter stringFromDate:date];
}

@end
