
#import <XCTest/XCTest.h>

#import "ISHolidays.h"

@interface ISHolidaysFRTests : XCTestCase

@property (strong, nonatomic) NSLocale *locale;
@property (strong, nonatomic) NSCalendar *calendar;
@property (strong, nonatomic) NSDateComponents *dateComponents;

@end

@implementation ISHolidaysFRTests

- (void)setUp
{
    [super setUp];

    self.locale = [NSLocale localeWithLocaleIdentifier:@"fr_FR"];
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

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Nouvel An");
}

- (void)testNewYear2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 1;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Nouvel An");
}

- (void)testNewYear2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 1;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Nouvel An");
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
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Nouvel An");
}

#pragma mark - Easter Monday

- (void)testEasterMonday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 17;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pâques");
}

- (void)testEasterMonday2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 4;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pâques");
}

- (void)testEasterMonday2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 4;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pâques");
}

- (void)testEasterMonday2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 4;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pâques");
}

- (void)testInvalidEasterMonday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidEasterMonday2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 4;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testEasterMondayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 4;
    self.dateComponents.day = 22;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pâques");
}


#pragma mark - Labour Day

- (void)testLabourDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête du Travail");
}

- (void)testLabourDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête du Travail");
}

- (void)testLabourDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête du Travail");
}

- (void)testLabourDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête du Travail");
}

- (void)testInvalidLabourDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 30;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidLabourDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testLabourDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête du Travail");
}

#pragma mark - Victory Day

- (void)testVictoryDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête de la Victoire");
}

- (void)testVictoryDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête de la Victoire");
}

- (void)testVictoryDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête de la Victoire");
}

- (void)testVictoryDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête de la Victoire");
}

- (void)testInvalidVictoryDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidVictoryDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 28;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testVictoryDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête de la Victoire");
}

#pragma mark - Feast of the Ascension

- (void)testFeastOfTheAscension2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Jeudi de l'Ascension");
}

- (void)testFeastOfTheAscension2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 10;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Jeudi de l'Ascension");
}

- (void)testFeastOfTheAscension2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 30;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Jeudi de l'Ascension");
}

- (void)testFeastOfTheAscension2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 10;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Jeudi de l'Ascension");
}

- (void)testInvalidFeastOfTheAscension2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 24;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidFeastOfTheAscension2040
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 6;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testFeastOfTheAscensionWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 30;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Jeudi de l'Ascension");
}

#pragma mark - Whit Monday

- (void)testWhitMonday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 6;
    self.dateComponents.day = 5;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pentecôte");
}

- (void)testWhitMonday2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 21;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pentecôte");
}

- (void)testWhitMonday2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 6;
    self.dateComponents.day = 10;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pentecôte");
}

- (void)testWhitMonday2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 21;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pentecôte");
}

- (void)testInvalidWhitMonday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 6;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidWhitMonday2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 7;
    self.dateComponents.day = 5;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testWhitMondayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 6;
    self.dateComponents.day = 10;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Lundi de Pentecôte");
}

#pragma mark - Bastille Day

- (void)testBastilleDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête Nationale Française");
}

- (void)testBastilleDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête Nationale Française");
}

- (void)testBastilleDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête Nationale Française");
}

- (void)testBastilleDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête Nationale Française");
}

- (void)testInvalidBastilleDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 7;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidBastilleDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 6;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testBastilleDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Fête Nationale Française");
}

#pragma mark - Assumption of Mary

- (void)testAssumptionOfMary2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Assomption");
}

- (void)testAssumptionOfMary2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Assomption");
}

- (void)testAssumptionOfMary2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Assomption");
}

- (void)testAssumptionOfMary2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Assomption");
}

- (void)testInvalidAssumptionOfMary2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 8;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidAssumptionOfMary2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 9;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testAssumptionOfMaryWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Assomption");
}

#pragma mark - All Saints' Day

- (void)testAllSaintsDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Toussaint");
}

- (void)testAllSaintsDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Toussaint");
}

- (void)testAllSaintsDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Toussaint");
}

- (void)testAllSaintsDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Toussaint");
}

- (void)testInvalidAllSaintsDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalidAllSaintsDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 10;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testAllSaintsDayWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Toussaint");
}

#pragma mark - Armistice of November 11th, 1918

- (void)test1918Armistice2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Armistice de 1918");
}

- (void)test1918Armistice2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Armistice de 1918");
}

- (void)test1918Armistice2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Armistice de 1918");
}

- (void)test1918Armistice2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Armistice de 1918");
}

- (void)testInvalid1918Armistice2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 10;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)testInvalid1918Armistice2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 12;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([ISHolidays holidayNameForDate:date inLocale:self.locale]);
}

- (void)test1918ArmisticeWithTime
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    self.dateComponents.hour = 9;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Armistice de 1918");
}

#pragma mark - Christmas

- (void)testChristmas2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Noël");
}

- (void)testChristmas2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Noël");
}

- (void)testChristmas2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Noël");
}

- (void)testChristmas2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Noël");
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
    
    XCTAssertEqualObjects([ISHolidays holidayNameForDate:date inLocale:self.locale], @"Noël");
}

@end
