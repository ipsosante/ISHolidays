
#import "NSDate+ISHolidays.h"
#import "ISHolidays.h"

@implementation NSDate (ISHolidays)

- (BOOL)isHoliday
{
    return [self localizedHolidayName] != nil;
}

- (NSString *)localizedHolidayName
{
    return [ISHolidays holidayNameForDateInCurrentLocale:self];
}

@end
