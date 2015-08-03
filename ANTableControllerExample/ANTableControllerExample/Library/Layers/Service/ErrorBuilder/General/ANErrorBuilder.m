//
//  ANGeneralErrorBuilder.m
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 1/26/15.
//  Copyright (c) 2015 ANTableControllerExample. All rights reserved.
//

#import "ANErrorBuilder.h"
#import "ANErrorBuilder+Private.h"

const struct ANErrorLocalizationTableAttributes ANErrorLocalizationTableAttributes = {
    .general = @"ANGeneralErrorLocalizable",
    .server = @"ANServerErrorLocalizable",
};

#pragma mark - Localized Keys

NSString* const kANLocalizationDescriptionKey = @"error.description.code.";
NSString* const kANLocalizationReasonKey = @"error.reason.code.";
NSString* const kANLocalizationDomainKey = @"domain";

@implementation ANErrorBuilder

+ (NSError *)errorWithType:(ANErrorType)type code:(NSInteger)code
{
    return [self errorWithType:type code:code descriptionArgument:nil];
}

+ (NSError*)errorWithType:(ANErrorType)type code:(NSInteger)code descriptionArgument:(NSString *)descriptionArg
{
    NSString* localizedTable;
    NSError* error;
    switch (type)
    {
        case ANErrorTypeGeneral:
            localizedTable = ANErrorLocalizationTableAttributes.general;
            break;
        case ANErrorTypeServer:
            localizedTable = ANErrorLocalizationTableAttributes.server;
            break;
            
        default: break;
    }
    if (localizedTable)
    {
        NSDictionary* userInfo = [self _userInfoByTable:localizedTable errorCode:code descriptionArgument:descriptionArg];
        NSString* domain = [@"mobi.anoda.%@" stringByAppendingString:[localizedTable lowercaseString]];
        error = [NSError errorWithDomain:domain code:code userInfo:userInfo];
    }
    return error;
}

+ (NSError *)errorWithReason:(NSString*)reason recovery:(NSString*)recovery
{
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: recovery ? : @"",
                               NSLocalizedFailureReasonErrorKey: reason ? : @""};
    return [NSError errorWithDomain:@"mobi.anoda.error" code:10001 userInfo:userInfo];
}


#pragma mark - Service Private Methods

+ (NSDictionary*)_userInfoByTable:(NSString*)table
                        errorCode:(NSInteger)errorCode
             descriptionArgument:(NSString*)descriptionArg
{
    NSString* errorDescriptionKey = [self _errorDescriptionKeyWithCode:errorCode];
    NSString* errorDescription = [self _localizedStringFromTable:table key:errorDescriptionKey];
    
    NSString* errorReasonKey = [self _errorReasonKeyWithCode:errorCode];
    NSString* errorReason = [self _localizedStringFromTable:table key:errorReasonKey];
    
    if (descriptionArg)
    {
        errorDescription = [NSString stringWithFormat:errorDescription, descriptionArg];
    }
    
    return  @{NSLocalizedDescriptionKey: errorDescription ? : @"",
              NSLocalizedFailureReasonErrorKey: errorReason ? : @""};
    
}


#pragma mark - Localized Strings

+ (NSString*)_localizedStringFromTable:(NSString*)table key:(NSString*)key
{
    return NSLocalizedStringFromTable(key, table, @"");
}


#pragma mark - Keys

+ (NSString*)_errorDescriptionKeyWithCode:(NSInteger)code
{
    return [kANLocalizationDescriptionKey stringByAppendingFormat:@"%ld", (long)code];
}

+ (NSString*)_errorReasonKeyWithCode:(NSInteger)code
{
    return [kANLocalizationReasonKey stringByAppendingFormat:@"%ld", (long)code];
}

@end
