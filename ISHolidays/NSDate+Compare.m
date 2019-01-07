
#import "NSDate+Compare.h"

@implementation NSDate (Compare)

- (BOOL)isEqualToDateExcludingTime:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
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
