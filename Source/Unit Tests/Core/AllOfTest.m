//
//  OCHamcrest - AllOfTest.m
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCAllOf.h>
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCMatcherAssert.h>


@interface AllOfTest : AbstractMatcherTest
@end

@implementation AllOfTest

- (id<HCMatcher>) createMatcher
{
    return allOf(equalTo(@"irrelevant"), equalTo(@"irrelevant"), nil);
}


- (void) testEvaluatesToTheTheLogicalConjunctionOfTwoOtherMatchers
{
    assertThat(@"good", allOf(equalTo(@"good"), equalTo(@"good"), nil));

    assertThat(@"good", isNot(allOf(equalTo(@"bad"), equalTo(@"good"), nil)));
    assertThat(@"good", isNot(allOf(equalTo(@"good"), equalTo(@"bad"), nil)));
    assertThat(@"good", isNot(allOf(equalTo(@"bad"), equalTo(@"bad"), nil)));
}


- (void) testEvaluatesToTheTheLogicalConjunctionOfManyOtherMatchers
{
    assertThat(@"good", allOf(
                            equalTo(@"good"),
                            equalTo(@"good"),
                            equalTo(@"good"),
                            equalTo(@"good"),
                            equalTo(@"good"),
                            nil));
    assertThat(@"good", isNot(allOf(
                            equalTo(@"good"),
                            equalTo(@"good"),
                            equalTo(@"bad"),
                            equalTo(@"good"),
                            equalTo(@"good"),
                            nil)));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"(\"good\" and \"bad\" and \"ugly\")",
            allOf(equalTo(@"good"), equalTo(@"bad"), equalTo(@"ugly"), nil));
}


- (void) testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(allOf(equalTo(@"good"), equalTo(@"good"), nil), @"good");
}


- (void) testMismatchDescriptionDescribesFirstFailingMatch
{
    assertMismatchDescription(@"\"good\" was \"bad\"", allOf(equalTo(@"bad"), equalTo(@"good"), nil), @"bad");
}


- (void) testDescribeMismatch
{
    assertDescribeMismatch(@"\"good\" was \"bad\"", allOf(equalTo(@"bad"), equalTo(@"good"), nil), @"bad");
}

@end
