
#import "ISHolidays.h"

#import "ISHolidays+FR.h"
#import "ISHolidays+US.h"

@implementation ISHolidays

+ (nullable NSString *)holidayNameForDateInCurrentLocale:(NSDate *)date
{
    return [self holidayNameForDate:date inLocale:[NSLocale currentLocale]];
}

+ (nullable NSString *)holidayNameForDate:(NSDate *)date inLocale:(NSLocale *)locale
{
    if ([locale.countryCode isEqualToString:@"FR"])
    {
        return [self holidayNameInFranceForDate:date];
    }
    else if ([locale.countryCode isEqualToString:@"US"])
    {
        return [self holidayNameInUSForDate:date];
    }

#ifndef NDEBUG
    NSString *reason = [NSString stringWithFormat:@"Unimplemented holidays for country code %@", locale.countryCode];
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil];
#endif

    return nil;
}

@end
