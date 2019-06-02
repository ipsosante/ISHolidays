
#import "NSDate+Compare.h"

@implementation NSDate (Compare)

- (BOOL)isEqualToDateExcludingTime:(NSDate *)date
{
    NSTimeZone *utcTimezone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSAssert(utcTimezone != nil, @"Expected UTC timezone not to be nil");

    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = utcTimezone;
    NSCalendarUnit units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *date1Components = [calendar components:units fromDate:self];
    NSDateComponents *date2Components = [calendar components:units fromDate:date];
    
    
    if (date1Components.year == date2Components.year
        && date1Components.day == date2Components.day
        && date1Components.month == date2Components.month) {
        
        return YES;
    }
    return NO;
}

@end
