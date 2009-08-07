@protocol HCMatcher;


#ifdef __cplusplus
extern "C" {
#endif

void HC_assertThatWithLocation(id actual, id<HCMatcher> matcher,
                               const char* fileName, int lineNumber);

#ifdef __cplusplus
}
#endif

/**
    OCUnit integration asserting that actual value satisfies matcher.
*/
#define HC_assertThat(actual, matcher)  \
    HC_assertThatWithLocation(actual, matcher, __FILE__, __LINE__)


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_assertThat, available if HC_SHORTHAND is defined.
*/
#define assertThat HC_assertThat

#endif
