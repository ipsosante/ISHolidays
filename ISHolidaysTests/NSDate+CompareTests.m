
#import <XCTest/XCTest.h>

#import "NSDate+Compare.h"

@interface NSDateCompareTests : XCTestCase

@property (strong, nonatomic) NSISO8601DateFormatter *isoDateFormatter;

@end

@implementation NSDateCompareTests

- (void)setUp
{
    [super setUp];

    self.isoDateFormatter = [[NSISO8601DateFormatter alloc] init];
}

- (void)testSameDateAndTime
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];

    XCTAssertTrue([left isEqualToDateExcludingTime:right]);
}

- (void)testSameDateDifferentHour
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T01:00:00+00:00"];

    XCTAssertTrue([left isEqualToDateExcludingTime:right]);
}

- (void)testSameDateDifferentMinutes
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:01:00+00:00"];

    XCTAssertTrue([left isEqualToDateExcludingTime:right]);
}

- (void)testSameDateDifferentSeconds
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:01+00:00"];

    XCTAssertTrue([left isEqualToDateExcludingTime:right]);
}

// While the dates appears to be equal, the timezone shift results in a day change in UTC.
- (void)testSameDateDifferentTimezoneNotEqualInUTC
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+01:00"]; // 1969-12-31T23:00:00+00:00

    NSTimeZone *utcTimezone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = utcTimezone;

    XCTAssertFalse([left isEqualToDateExcludingTime:right inCalendar:calendar]);
}

// While this comparison fails in UTC, it returns YES in Europe/Paris, because this timezone is always at least UTC+01:00.
- (void)testSameDateDifferentTimezoneEqualInParis
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+01:00"];

    NSTimeZone *utcTimezone = [NSTimeZone timeZoneWithName:@"Europe/Paris"];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = utcTimezone;

    XCTAssertTrue([left isEqualToDateExcludingTime:right inCalendar:calendar]);
}

// While the dates appears to be equal, the timezone shift results in a day change in UTC.
- (void)testSameDateWildlyDifferentTimezoneNotEqualInUTC
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+12:00"]; // 1969-12-31T12:00:00+00:00

    NSTimeZone *utcTimezone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = utcTimezone;

    XCTAssertFalse([left isEqualToDateExcludingTime:right inCalendar:calendar]);
}

// While the dates appears to be equal, the timezone shift results in a day change in Paris.
- (void)testSameDateWildlyDifferentTimezoneNotEqualInParis
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+12:00"]; // 1969-12-31T12:00:00+00:00

    NSTimeZone *utcTimezone = [NSTimeZone timeZoneWithName:@"Europe/Paris"];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = utcTimezone;

    XCTAssertFalse([left isEqualToDateExcludingTime:right inCalendar:calendar]);
}

- (void)testSameDateDifferentTimezone
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00-01:00"]; // 1970-01-01T01:00:00+00:00

    XCTAssertTrue([left isEqualToDateExcludingTime:right]);
}

- (void)testSameDateWildlyDifferentTimezone
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T00:00:00-12:00"]; // 1970-01-01T12:00:00+00:00

    XCTAssertTrue([left isEqualToDateExcludingTime:right]);
}

- (void)testSameDateDifferentTimeSameTimzone
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T03:38:27+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T11:42:52+00:00"];

    XCTAssertTrue([left isEqualToDateExcludingTime:right]);
}

- (void)testSameDateDifferentTime
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T12:33:32+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T04:14:04+03:00"];

    XCTAssertTrue([left isEqualToDateExcludingTime:right]);
}

- (void)testSameDateDifferentTimeExceedingMidnight
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"1970-01-01T12:33:32+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"1970-01-01T04:14:04+10:00"];

    XCTAssertFalse([left isEqualToDateExcludingTime:right]);
}

- (void)testDifferentYearSameTime
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"2018-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"2009-01-01T00:00:00+00:00"];

    XCTAssertFalse([left isEqualToDateExcludingTime:right]);
}

- (void)testDifferentMonthSameTime
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"2019-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"2019-04-01T00:00:00+00:00"];

    XCTAssertFalse([left isEqualToDateExcludingTime:right]);
}

- (void)testDifferentDaySameTime
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"2019-01-01T00:00:00+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"2019-01-23T00:00:00+00:00"];

    XCTAssertFalse([left isEqualToDateExcludingTime:right]);
}

- (void)testDifferentDateAndTime
{
    NSDate *left = [self.isoDateFormatter dateFromString:@"2018-11-21T12:33:32+00:00"];
    NSDate *right = [self.isoDateFormatter dateFromString:@"2009-08-04T04:14:04+02:00"];

    XCTAssertFalse([left isEqualToDateExcludingTime:right]);
}

@end
