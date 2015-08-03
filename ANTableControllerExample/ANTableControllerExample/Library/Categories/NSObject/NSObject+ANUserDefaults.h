//
//  NSObject+ANUserDefaults.h
//  ANTableControllerExample
//
//  Created by Oksana Kovalchuk on 5/17/15.
//  Copyright (c) 2015 ANODA. All rights reserved.
//

@interface NSObject (ANUserDefaults)

- (NSUserDefaults *)an_dataSource;
- (void)an_updateObject:(id)object forKey:(NSString*)key;
- (NSString*)an_stringForKey:(NSString*)key;

@end
