
#import <XCTest/XCTest.h>

#import "ISHolidays.h"

@interface ISHolidaysUSTests : XCTestCase

@property (strong, nonatomic) NSLocale *locale;
@property (strong, nonatomic) NSCalendar *calendar;
@property (strong, nonatomic) NSDateComponents *dateComponents;

@end

@implementation ISHolidaysUSTests

- (void)setUp
{
    [super setUp];

    self.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    self.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    self.dateComponents = [[NSDateComponents alloc] init];
}

- (void)testWorstCasePerformance
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 12;
    self.dateComponents.day = 1;
    NSDate *regularDay = [self.calendar dateFromComponents:self.dateComponents];

    [self measureBlock:^{
        for (NSInteger i = 0; i < 500; i++)
        {
            XCTAssertNil([ISHolidays holidayNameForDate:regularDay inLocale:self.locale]);
        }
    }];
}

- (void)testWorstCasePerformanceWithTime
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 12;
    self.dateComponents.day = 1;
    self.dateComponents.hour = 9;
    NSDate *regularDay = [self.calendar dateFromComponents:self.dateComponents];
    
    [self measureBlock:^{
        for (NSInteger i = 0; i < 500; i++)
        {
            XCTAssertNil([ISHolidays holidayNameForDate:regularDay inLocale:self.locale]);
        }
    }];
}

#pragma mark - New Year

- (void)testNewYear2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 1;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"New Year");
}

- (void)testNewYear2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 1;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"New Year");
}

- (void)testNewYear2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 1;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"New Year");
}

- (void)testInvalidNewYearMonth
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 2;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidNewYearDay
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 1;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testNewYearWithTime
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 1;
    self.dateComponents.day = 1;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"New Year");
}

#pragma mark - Birthday of Martin Luther King, Jr.

- (void)testMartinLutherKingJrDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 1;
    self.dateComponents.day = 16;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Martin Luther King Jr. Day");
}

- (void)testMartinLutherKingJrDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 1;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Martin Luther King Jr. Day");
}

- (void)testMartinLutherKingJrDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 1;
    self.dateComponents.day = 21;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Martin Luther King Jr. Day");
}

- (void)testMartinLutherKingJrDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 1;
    self.dateComponents.day = 16;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Martin Luther King Jr. Day");
}

- (void)testInvalidMartinLutherKingJrDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 1;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidMartinLutherKingJrDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 1;
    self.dateComponents.day = 16;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testMartinLutherKingJrDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 1;
    self.dateComponents.day = 21;
    self.dateComponents.hour = 17;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Martin Luther King Jr. Day");
}

#pragma mark - Washington's Birthday / Presidents' Day

- (void)testWashingtonBirthday1879
{
    self.dateComponents.year = 1879;
    self.dateComponents.month = 2;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Washington's Birthday");
}

- (void)testWashingtonBirthday1900
{
    self.dateComponents.year = 1900;
    self.dateComponents.month = 2;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Washington's Birthday");
}

- (void)testWashingtonBirthday1914
{
    self.dateComponents.year = 1914;
    self.dateComponents.month = 2;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Washington's Birthday");
}

- (void)testInvalidWashingtonBirthday1970
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 2;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNotEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Washington's Birthday");
}

- (void)testInvalidWashingtonBirthday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 2;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNotEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Washington's Birthday");
}

- (void)testWashingtonBirthdayWithTime
{
    self.dateComponents.year = 1970;
    self.dateComponents.month = 2;
    self.dateComponents.day = 22;
    self.dateComponents.hour = 11;
    self.dateComponents.minute = 52;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Washington's Birthday");
}

- (void)testPresidentsDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 2;
    self.dateComponents.day = 20;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Presidents' Day");
}

- (void)testPresidentsDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 2;
    self.dateComponents.day = 19;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Presidents' Day");
}

- (void)testPresidentsDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 2;
    self.dateComponents.day = 18;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Presidents' Day");
}

- (void)testPresidentsDay2033
{
    self.dateComponents.year = 2033;
    self.dateComponents.month = 2;
    self.dateComponents.day = 21;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Presidents' Day");
}

- (void)testInvalidPresidentsDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 2;
    self.dateComponents.day = 19;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidPresidentsDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 2;
    self.dateComponents.day = 18;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testPresidentsDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 2;
    self.dateComponents.day = 18;
    self.dateComponents.hour = 17;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Presidents' Day");
}

#pragma mark - Memorial Day

- (void)testMemorialDay1868
{
    self.dateComponents.year = 1868;
    self.dateComponents.month = 5;
    self.dateComponents.day = 30;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Memorial Day");
}

- (void)testMemorialDay1900
{
    self.dateComponents.year = 1900;
    self.dateComponents.month = 5;
    self.dateComponents.day = 30;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Memorial Day");
}

- (void)testMemorialDay1969
{
    self.dateComponents.year = 1969;
    self.dateComponents.month = 5;
    self.dateComponents.day = 30;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Memorial Day");
}

- (void)testMemorialDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 29;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Memorial Day");
}

- (void)testMemorialDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 28;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Memorial Day");
}

- (void)testMemorialDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 27;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Memorial Day");
}

- (void)testMemorialDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 28;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Memorial Day");
}

- (void)testInvalidMemorialDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 27;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidMemorialDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 29;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testMemorialDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 27;
    self.dateComponents.hour = 17;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Memorial Day");
}

#pragma mark - Independence Day

- (void)testIndependenceDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 7;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Independence Day");
}

- (void)testIndependenceDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 7;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Independence Day");
}

- (void)testIndependenceDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 7;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Independence Day");
}

- (void)testIndependenceDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 7;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Independence Day");
}

- (void)testInvalidIndependenceDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidIndependenceDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 6;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testIndependenceDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 7;
    self.dateComponents.day = 4;
    self.dateComponents.hour = 12;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Independence Day");
}

#pragma mark - Labor Day

- (void)testLaborDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 9;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Labor Day");
}

- (void)testLaborDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 9;
    self.dateComponents.day = 3;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Labor Day");
}

- (void)testLaborDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 9;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Labor Day");
}

- (void)testLaborDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 9;
    self.dateComponents.day = 3;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Labor Day");
}

- (void)testInvalidLaborDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 30;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidLaborDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 9;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testLaborDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 9;
    self.dateComponents.day = 2;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Labor Day");
}

#pragma mark - Columbus Day

- (void)testColumbusDay1934
{
    self.dateComponents.year = 1934;
    self.dateComponents.month = 10;
    self.dateComponents.day = 12;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Columbus Day");
}

- (void)testColumbusDay1965
{
    self.dateComponents.year = 1965;
    self.dateComponents.month = 10;
    self.dateComponents.day = 12;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Columbus Day");
}

- (void)testColumbusDay1970
{
    self.dateComponents.year = 1970;
    self.dateComponents.month = 10;
    self.dateComponents.day = 12;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Columbus Day");
}

- (void)testInvalidColumbusDay1971
{
    self.dateComponents.year = 1971;
    self.dateComponents.month = 10;
    self.dateComponents.day = 12;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testColumbusDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 10;
    self.dateComponents.day = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Columbus Day");
}

- (void)testColumbusDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 10;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Columbus Day");
}

- (void)testColumbusDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 10;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Columbus Day");
}

- (void)testColumbusDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 10;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Columbus Day");
}

- (void)testInvalidColumbusDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 10;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidColumbusDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 10;
    self.dateComponents.day = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testColumbusDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 10;
    self.dateComponents.day = 14;
    self.dateComponents.hour = 17;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Columbus Day");
}

#pragma mark - Veterans Day

- (void)testVeteransDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Veterans Day");
}

- (void)testVeteransDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Veterans Day");
}

- (void)testVeteransDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Veterans Day");
}

- (void)testVeteransDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Veterans Day");
}

- (void)testInvalidVeteransDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 10;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidVeteransDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 12;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testVeteransDayeWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Veterans Day");
}

#pragma mark - Thanksgiving

- (void)testThanksgiving2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 23;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Thanksgiving");
}

- (void)testThanksgiving2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Thanksgiving");
}

- (void)testThanksgiving2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 28;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Thanksgiving");
}

- (void)testThanksgiving2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 11;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Thanksgiving");
}

- (void)testInvalidThanksgiving2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidThanksgiving2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 23;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testThanksgivingWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 28;
    self.dateComponents.hour = 20;
    self.dateComponents.second = 43;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Thanksgiving");
}

#pragma mark - Christmas

- (void)testChristmas2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Christmas");
}

- (void)testChristmas2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Christmas");
}

- (void)testChristmas2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Christmas");
}

- (void)testChristmas2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Christmas");
}

- (void)testInvalidChristmas2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidChristmas2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 12;
    self.dateComponents.day = 24;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testChristmasWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Christmas");
}

@end
