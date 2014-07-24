//
//  NSObject+AssociatedObjects.h
//
//  Created by Andy Matuschak on 8/27/09.
//  Public domain because I love you.
//

#import <Foundation/Foundation.h>

@interface NSObject (AMAssociatedObjects)

- (void)associateValue:(id)value strong:(BOOL)strong withKey:(void *)key;

- (id)associatedValueForKey:(void *)key;

@end

