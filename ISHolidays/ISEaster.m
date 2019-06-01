
#import "ISEaster.h"

@implementation ISEaster

+ (nullable NSDate *)easterForYear:(NSInteger)year inCalendar:(NSCalendar *)calendar
{
    // g = Golden year - 1
    NSInteger g = year % 19;

    // Extra days to add for method 2 (converting Julian date to Gregorian date)
    NSInteger extraDays = 0;

    NSInteger century = year / 100;

    // h = (23 - Epact) mod 30
    NSInteger h = (century - century / 4 - (8 * century + 13) / 25 + 19 * g + 15) % 30;

    // i = Number of days from March 21 to Paschal Full Moon
    NSInteger i = h - (h / 28) * (1 - (h / 28) * (29 / (h + 1)) * ((21 - g) / 11));

    // j - Weekday for Paschal Full Moon (0=Sunday, etc)
    NSInteger j = (year + year / 4 + i + 2 - century + century / 4) % 7;

    // p = Number of days from March 21 to Sunday on or before PFM
    //     (-6 to 28 methods Julian and Wester, to 56 for method Orthodox)
    // p can be from -6 to 56 corresponding to dates 22 March to 23 May
    // (later dates apply to method 2, although 23 May never actually occurs)
    NSInteger p = i - j + extraDays;

    NSDateComponents *easterComponents = [[NSDateComponents alloc] init];
    easterComponents.year = year;
    easterComponents.day = 1 + (p + 27 + (p + 6) / 40) % 31;
    easterComponents.month = 3 + (p + 26) / 30;

    NSDate *easter = [calendar dateFromComponents:easterComponents];
    return easter;
}

@end
