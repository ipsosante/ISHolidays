
#import "ISHolidays+FR.h"

#import "ISEaster.h"
#import "NSDate+Compare.h"
#import "ISGregorianCalendarWeekday.h"

@implementation ISHolidays (FR)

+ (nullable NSString *)holidayNameInFranceForDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];

    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:units fromDate:date];
    if (components == nil) {
        return nil;
    }

    NSInteger year = components.year;
    NSInteger month = components.month;
    NSInteger day = components.day;

    // New Year
    if (year > 1810 && month == 1 && day == 1)
    {
        return @"Nouvel An";
    }

    NSDate *easter = [ISEaster easterForYear:year inCalendar:calendar];
    if (easter == nil) {
        return nil;
    }

    // Easter Monday
    if (year > 1886) {
        NSDate *easterNextMonday = [calendar nextDateAfterDate:easter matchingUnit:NSCalendarUnitWeekday value:ISGregorianCalendarWeekdayMonday options:NSCalendarMatchStrictly];
        if (easterNextMonday != nil && [date isEqualToDateExcludingTime:easterNextMonday])

        {
            return @"Lundi de Pâques";
        }
    }

    // Labor day
    if (year > 1948 && month == 5 && day == 1)
    {
        return @"Fête du Travail";
    }

    // Victory Day
    if (((year >= 1953 && year < 1959) || year >= 1981) && month == 5 && day == 8)
    {
        return @"Fête de la Victoire";
    }

    // Feast of the Ascension
    if (year >= 1802) {
        NSDate *ascension = [calendar dateByAddingUnit:NSCalendarUnitDay value:39 toDate:easter options:0];
        if (ascension != nil && [date isEqualToDateExcludingTime:ascension])
        {
            return @"Jeudi de l'Ascension";
        }
    }
    
    // Whit Monday (Pentecost Monday)
    if (year > 1886) {
        NSDate *pentecost = [calendar dateByAddingUnit:NSCalendarUnitDay value:50 toDate:easter options:0];
        if (pentecost != nil && [date isEqualToDateExcludingTime:pentecost])
        {
            return @"Lundi de Pentecôte";
        }
    }

    // Bastille Day ("fête nationale française")
    if (year > 1880 && month == 7 && day == 14)
    {
        return @"Fête Nationale Française";
    }

    // Assumption of Mary
    if (year >= 1802 && month == 8 && day == 15)
    {
        return @"Assomption";
    }

    // All Saints' Day
    if (year >= 1802 && month == 11 && day == 1)
    {
        return @"Toussaint";
    }

    // Armistice of November 11th, 1918
    if (year >= 1922 && month == 11 && day == 11)
    {
        return @"Armistice de 1918";
    }

    // Christmas
    if (year >= 1802 && month == 12 && day == 25)
    {
        return @"Noël";
    }

    return nil;
}

@end
