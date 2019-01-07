
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Compare)

/// Return YES if dates are equal, compare year, month and day only.
- (BOOL)isEqualToDateExcludingTime:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
