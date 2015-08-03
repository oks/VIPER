//
//  ANGeneralErrorBuilder.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/26/15.
//  Copyright (c) 2015 ANTableControllerExample. All rights reserved.
//

#import "ANGeneralErrorConstants.h"

extern const struct ANErrorLocalizationTableAttributes {
    __unsafe_unretained NSString *general;
    __unsafe_unretained NSString *server;
    
} ANErrorLocalizationTableAttributes;


typedef NS_ENUM(NSInteger, ANErrorType)
{
    ANErrorTypeGeneral,
    ANErrorTypeServer
};

#pragma mark - Localized Table Keys

extern NSString* const kANLocalizationDescriptionKey;
extern NSString* const kANLocalizationReasonKey;
extern NSString* const kANLocalizationDomainKey;

@interface ANErrorBuilder : NSObject

+ (NSError*)errorWithType:(ANErrorType)type code:(NSInteger)code descriptionArgument:(NSString*)descriptionArg;
+ (NSError*)errorWithType:(ANErrorType)type code:(NSInteger)code;

+ (NSError*)errorWithReason:(NSString*)reason recovery:(NSString*)recovery;

@end
