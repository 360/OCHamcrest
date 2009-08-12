//
//  OCHamcrest - HCIsNot.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCIsNot.h"

    // OCHamcrest
#import "HCDescription.h"
#import "HCWrapShortcut.h"


@implementation HCIsNot

+ (HCIsNot*) isNot:(id<HCMatcher>)aMatcher
{
    return [[[HCIsNot alloc] initNot:aMatcher] autorelease];
}


- (id) initNot:(id<HCMatcher>)aMatcher
{
    self = [super init];
    if (self != nil)
        matcher = [aMatcher retain];
    return self;
}


- (void) dealloc
{
    [matcher release];
    
    [super dealloc];
}


- (BOOL) matches:(id)item
{
    return ![matcher matches:item];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"not "] appendDescriptionOf:matcher];
}

@end


extern "C" {

id<HCMatcher> HC_isNot(id item)
{
    return [HCIsNot isNot:HC_wrapShortcut(item)];
}

}   // extern "C"
