//
//  UIAlertView+AutoDismiss.m
//
//  Created by Chris Roff on 7/23/14.
//

#import "UIAlertView+AutoDismiss.h"
#import "NSObject+AssociatedObjects.h"

////////////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////////////

@interface CRWatcher : NSObject
@end

@implementation CRWatcher

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(dismissAlert)
													 name:UIApplicationWillResignActiveNotification
												   object:nil];
    }
    return self;
}

- (void)dismissAlert
{
	UIAlertView *av = [self associatedValueForKey:@"AlertViewKey"];
	[av dismissWithClickedButtonIndex:[av cancelButtonIndex] animated:NO];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////////////

@implementation UIAlertView (AutoDismiss)

- (void)autoDismissWhenEnteringBackground
{
	CRWatcher *w = [[CRWatcher alloc] init];
	[w associateValue:self strong:NO withKey:@"AlertViewKey"];
	[self associateValue:w strong:YES withKey:@"WatcherKey"];
}

@end
