#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Shuffle)

- (nonnull NSArray *)shuffledArray;

@end

@interface NSMutableArray (Shuffle)

- (void)shuffle;

@end

NS_ASSUME_NONNULL_END