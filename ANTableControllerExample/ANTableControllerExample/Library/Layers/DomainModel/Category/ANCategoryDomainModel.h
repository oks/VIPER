//
//  ANCategoryDomainModel.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 7/29/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

#import "ANBaseDomainModel.h"

extern const struct ANCategoryDomainModelAttributes {
    __unsafe_unretained NSString *name;
    __unsafe_unretained NSString *imageURLString;
} ANCategoryDomainModelAttributes;

@interface ANCategoryDomainModel : ANBaseDomainModel

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* imageURLString;

+ (instancetype)categoryWithName:(NSString*)name imageURLString:(NSString*)URLString;

@end
