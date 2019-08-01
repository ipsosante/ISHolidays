
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Compare)

/// Return YES if dates are equal, compare year, month and day only.
///
/// - Note: The comparison is done in the current NSCalendar, and results may differ on different timezones.
- (BOOL)isEqualToDateExcludingTime:(NSDate *)date;

/// Return YES if dates are equal, compare year, month and day only.
- (BOOL)isEqualToDateExcludingTime:(NSDate *)date inCalendar:(NSCalendar *)calendar;

@end

NS_ASSUME_NONNULL_END
