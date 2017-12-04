[![Build Status](https://travis-ci.org/ipsosante/ISHolidays.svg?branch=master)](https://travis-ci.org/ipsosante/ISHolidays)

# ISHolidays

Holidays calculations for NSDate.

Note that date calculations are done exclusively in the Gregorian Calendar.

## Examples

```objectivec
NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
dateComponents.year = 2017;
dateComponents.month = 12;
dateComponents.day = 25;

NSCalendar *gregorianCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
NSDate *christmas = [gregorianCalendar dateFromComponents:dateComponents];

NSString *holidayName = [christmas localizedHolidayName];
NSLog(@"%@", holidayName); // "Noël"

BOOL isHoliday = [christmas isHoliday];
NSLog(@"%d", isHoliday); // YES
```

## Localization

By default, the library uses the user's current locale to define the country for which to calculate the holidays. You can use `+[ISHolidays holidayNameForDate:inLocale:]` if you want to look up a holiday in a different locale (but check if that locale was implemented first, or you'll always get `nil` back).
