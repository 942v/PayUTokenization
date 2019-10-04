//
//  PUHTTPSessionManager.h
//  AFNetworking
//
//  Created by Guillermo Saenz on 9/28/19.
//

@import AFNetworking;

NS_ASSUME_NONNULL_BEGIN

@interface PUHTTPSessionManager : AFHTTPSessionManager

+ (PUHTTPSessionManager *)initWithBaseURLString:(NSString *)baseURLString;
+ (PUHTTPSessionManager *)manager;

@end

NS_ASSUME_NONNULL_END
