
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

#if TARGET_IPHONE_SIMULATOR
    // When running the simulator with the default settings, we get a weird locale with no country code.
    // Default to the US holidays in this case.
    if ([locale.localeIdentifier isEqualToString:@"en"]) {
        return [self holidayNameInUSForDate:date];
    }
#endif

#ifndef NDEBUG
    NSString *reason = [NSString stringWithFormat:@"Unimplemented holidays for country code %@", locale.countryCode];
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil];
#endif

    return nil;
}

@end
