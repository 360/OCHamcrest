//
//  OCHamcrest - DescribedAsTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCDescribedAs.h>
#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsNot.h>


@interface DescribedAsTest : AbstractMatcherTest
@end

@implementation DescribedAsTest

- (id<HCMatcher>) createMatcher
{
    return describedAs(@"irrelevant", anything(), nil);
}


- (void) testOverridesDescriptionOfOtherMatcherWithThatPassedToConstructor
{
    id<HCMatcher> m1 = describedAs(@"m1 description", anything(), nil);
    id<HCMatcher> m2 = describedAs(@"m2 description", isNot(anything()), nil);

    assertDescription(@"m1 description", m1);
    assertDescription(@"m2 description", m2);
}


- (void) testAppendsValuesToDescription
{
    id<HCMatcher> m = describedAs(@"value 1 = %0, value 2 = %1",
                                anything(),
                                [NSNumber numberWithInt:33],
                                [NSNumber numberWithInt:97],
                                nil);
    
    assertDescription(@"value 1 = <33>, value 2 = <97>", m);
}


- (void) testHandlesSubstitutionAtBeginning
{
    id<HCMatcher> m = describedAs(@"%0ok",
                                anything(),
                                [NSNumber numberWithInt:33],
                                nil);
    
    assertDescription(@"<33>ok", m);
}


- (void) testHandlesSubstitutionAtEnd
{
    id<HCMatcher> m = describedAs(@"ok%0",
                                anything(),
                                [NSNumber numberWithInt:33],
                                nil);
    
    assertDescription(@"ok<33>", m);
}


- (void) testDoesNotProcessPercentFollowedByNonDigit
{
    id<HCMatcher> m = describedAs(@"With 33% remaining", anything(), nil);
    
    assertDescription(@"With 33% remaining", m);
}


- (void) testDelegatesMatchingToAnotherMatcher
{
    id<HCMatcher> m1 = describedAs(@"m1 description", anything(), nil);
    id<HCMatcher> m2 = describedAs(@"m2 description", isNot(anything()), nil);

    STAssertTrue([m1 matches:@"hi"], @"");
    STAssertFalse([m2 matches:@"hi"], @"");
}

@end
