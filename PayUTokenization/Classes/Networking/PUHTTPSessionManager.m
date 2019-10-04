//
//  PUHTTPSessionManager.m
//  AFNetworking
//
//  Created by Guillermo Saenz on 9/28/19.
//

#import "PUHTTPSessionManager.h"

@interface PUHTTPSessionManager ()

@property (nonatomic, strong) NSString *baseURLString;

@end

@implementation PUHTTPSessionManager

static PUHTTPSessionManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (PUHTTPSessionManager *)initWithBaseURLString:(NSString *)baseURLString {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] initWithBaseURLString:baseURLString];
    });
    
    return SINGLETON;
}

+ (PUHTTPSessionManager *)manager {
    NSAssert(SINGLETON, @"You must initialize this class with the base URL");
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone {
    return [self manager];
}

- (id)copy {
    return [[PUHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURLString]];
}

- (id)mutableCopy {
    return [[PUHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURLString]];
}

- (instancetype)initWithBaseURLString:(NSString *)URLString {
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super initWithBaseURL:[NSURL URLWithString:URLString]];
    if (self) {
        
        self.baseURLString = URLString;
        
        self.requestSerializer = AFJSONRequestSerializer.serializer;
        self.responseSerializer = AFJSONResponseSerializer.serializer;
        
        [AFNetworkActivityIndicatorManager.sharedManager setEnabled:YES];
        
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    }
    return self;
}

@end
