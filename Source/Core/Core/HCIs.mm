#import "HCIs.h"

#import "HCDescription.h"
#import "HCWrapShortcut.h"


@implementation HCIs

+ (HCIs*) is:(id<HCMatcher>)aMatcher
{
    return [[[HCIs alloc] initWithMatcher:aMatcher] autorelease];
}


- (id) initWithMatcher:(id<HCMatcher>)aMatcher
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
    return [matcher matches:item];
}


- (void) describeTo:(id<HCDescription>)description
{
    [[description appendText:@"is "] appendDescriptionOf:matcher];
}

@end


extern "C" {

id<HCMatcher> HC_is(id item)
{
    return [HCIs is:HC_wrapShortcut(item)];
}

}   // extern "C"
