#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

@interface ExampleWithAssertThat : SenTestCase
@end

@implementation ExampleWithAssertThat

- (void) testUsingAssertThat
{
    assertThat(@"xx", is(@"xx"));
    assertThat(@"yy", isNot(@"xx"));
    assertThat(@"i like cheese", containsString(@"cheese"));
}

- (void) testUsingNumbers
{
    assertThatInt(42, equalToInt(42));
    assertThatUnsignedShort(6 * 9, isNot(equalToUnsignedShort(42)));
}

@end
