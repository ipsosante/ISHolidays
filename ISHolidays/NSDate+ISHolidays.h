
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ISHolidays)

/// Return YES if the date is a holiday in the current locale.
- (BOOL)isHoliday;

/// Return the name of the holiday at `date` in the current locale, or nil if `date` is not a holiday.
- (nullable NSString *)localizedHolidayName;

/// Return YES if dates are equal, compare year, month and day only.
- (BOOL)checkEqualityWithoutTimeWith:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
