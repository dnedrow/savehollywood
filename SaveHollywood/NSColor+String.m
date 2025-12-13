#import "NSColor+String.h"

@implementation NSColor (String)

+ (NSColor *)colorFromString:(NSString *)inString
{
    NSColor * tColor=nil;
    
    if (inString!=nil)
    {
        NSArray * tComponents=[inString componentsSeparatedByString:@"|"];
    
        if ([tComponents count]==3)
        {
            tColor=[NSColor colorWithSRGBRed:[tComponents[0] floatValue]
                                       green:[tComponents[1] floatValue]
                                        blue:[tComponents[2] floatValue]
                                       alpha:1.0];
        }
    }
    
    return tColor;
}

#pragma mark -

- (NSString *)stringValue
{
    NSColorSpace *colorSpace = [NSColorSpace genericRGBColorSpace];
    NSColor *tColor = [self colorUsingColorSpace:colorSpace];
    
    return([NSString stringWithFormat:@"%f|%f|%f",(float)[tColor redComponent],(float)[tColor greenComponent],(float)[tColor blueComponent]]);
}

@end
