#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSColor (String)

+ (nullable NSColor *)colorFromString:(nullable NSString *)inString;

- (nonnull NSString *)stringValue;

@end

NS_ASSUME_NONNULL_END
