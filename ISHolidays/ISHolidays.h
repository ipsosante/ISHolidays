
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Inspired by https://github.com/ryanss/python-holidays
NS_SWIFT_NAME(Holidays)
@interface ISHolidays : NSObject

/// Return the local name of the holiday for `date` in the current locale, or nil if `date` is not a holiday.
+ (nullable NSString *)holidayNameForDateInCurrentLocale:(NSDate *)date;

/// Return the local name of the holiday for `date` in the locale `locale`, or nil if `date` is not a holiday.
+ (nullable NSString *)holidayNameForDate:(NSDate *)date inLocale:(NSLocale *)locale;

@end

NS_ASSUME_NONNULL_END
