
#import "ISHolidays+US.h"

#import "NSDate+Compare.h"
#import "ISGregorianCalendarWeekday.h"

// Note that for the moment only federal (i.e. non-state dependant) holidays are implemented.
// If you need holidays for a specific state, please submit a PR :)
// https://en.wikipedia.org/wiki/Federal_holidays_in_the_United_States
@implementation ISHolidays (US)

+ (nullable NSString *)holidayNameInUSForDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];

    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDateComponents *components = [calendar components:units fromDate:date];
    if (components == nil) {
        return nil;
    }

    NSInteger year = components.year;
    NSInteger month = components.month;
    NSInteger day = components.day;
    NSInteger weekday = components.weekday;

    // New Year
    if (year > 1870 && month == 1 && day == 1)
    {
        return @"New Year";
    }

    // Birthday of Martin Luther King, Jr.
    if (year >= 1986 && month == 1 && day >= 15 && day <= 21 && weekday == ISGregorianCalendarWeekdayMonday) {
        return @"Martin Luther King Jr. Day";
    }

    // Washington's Birthday / Presidents' Day
    if (year >= 1879 && year < 1971 && month == 2 && day == 22) {
        return @"Washington's Birthday";
    }
    else if (year >= 1971 && month == 2 && day >= 15 && day <= 21 && weekday == ISGregorianCalendarWeekdayMonday) {
        return @"Presidents' Day";
    }

    // Memorial Day
    if ((year >= 1868 && year < 1970 && month == 5 && day == 30) ||
        (year >= 1970 && month == 5 && day >= 25 && day <= 31 && weekday == ISGregorianCalendarWeekdayMonday))
    {
        return @"Memorial Day";
    }

    // Independence Day
    if (year >= 1777 && month == 7 && day == 4) {
        return @"Independence Day";
    }

    // Labor Day
    if (year >= 1894 && month == 9 && day >= 1 && day <= 7 && weekday == ISGregorianCalendarWeekdayMonday) {
        return @"Labor Day";
    }

    // Columbus Day
    if ((year >= 1934 && year < 1971 && month == 10 && day == 12) ||
        (year >= 1971 && month == 10 && day >= 8 && day <= 14 && weekday == ISGregorianCalendarWeekdayMonday)) {
        return @"Columbus Day";
    }

    // Veterans Day
    if (year >= 1938 && month == 11 && day == 11) {
        return @"Veterans Day";
    }

    // Thanksgiving
    if (year >= 1941 && month == 11 && day >= 22 && day <= 28 && weekday == ISGregorianCalendarWeekdayThursday) {
        return @"Thanksgiving";
    }

    // Christmas
    if (year >= 1870 && month == 12 && day == 25) {
        return @"Christmas";
    }

    return nil;
}

@end
