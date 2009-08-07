#import "HCStringEndsWith.h"

#import "HCDescription.h"


@implementation HCStringEndsWith

+ (HCStringEndsWith*) stringEndsWith:(NSString*)aSubstring
{
    return [[[HCStringEndsWith alloc] initWithSubstring:aSubstring] autorelease];
}


- (BOOL) matches:(id)item
{
    if (![item respondsToSelector:@selector(hasSuffix:)])
        return NO;
    
    return [item hasSuffix:substring];
}

@end


@implementation HCStringEndsWith (SubclassResponsibility)

- (NSString*) relationship
{
    return @"ending with";
}

@end


extern "C" {

id<HCMatcher> HC_endsWith(NSString* aSubstring)
{
    return [HCStringEndsWith stringEndsWith:aSubstring];
}

}   // extern "C"
