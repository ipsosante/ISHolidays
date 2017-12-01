
#import <XCTest/XCTest.h>

#import "NSDate+ISHolidays.h"

@interface ISHolidaysTests : XCTestCase

@property (strong, nonatomic) NSCalendar *calendar;
@property (strong, nonatomic) NSDateComponents *dateComponents;

@end

@implementation ISHolidaysTests

- (void)setUp
{
    [super setUp];

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
        for (NSInteger i = 0; i < 1000; i++)
        {
            XCTAssertFalse([regularDay isHoliday]);
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

    XCTAssertEqualObjects([date localizedHolidayName], @"Nouvel An");
}

- (void)testNewYear2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 1;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Nouvel An");
}

- (void)testNewYear2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 1;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Nouvel An");
}

- (void)testInvalidNewYearMonth
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 2;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidNewYearDay
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 1;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Easter Monday

- (void)testEasterMonday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 17;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Lundi de Pâques");
}

- (void)testEasterMonday2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 4;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Lundi de Pâques");
}

- (void)testEasterMonday2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 4;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Lundi de Pâques");
}

- (void)testEasterMonday2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 4;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Lundi de Pâques");
}

- (void)testInvalidEasterMonday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidEasterMonday2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 4;
    self.dateComponents.day = 22;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Labour Day

- (void)testLabourDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête du Travail");
}

- (void)testLabourDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête du Travail");
}

- (void)testLabourDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête du Travail");
}

- (void)testLabourDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête du Travail");
}

- (void)testInvalidLabourDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 30;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidLabourDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Victory Day

- (void)testVictoryDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête de la Victoire");
}

- (void)testVictoryDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête de la Victoire");
}

- (void)testVictoryDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête de la Victoire");
}

- (void)testVictoryDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête de la Victoire");
}

- (void)testInvalidVictoryDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 4;
    self.dateComponents.day = 8;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidVictoryDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 28;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Feast of the Ascension

- (void)testFeastOfTheAscension2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Jeudi de l'Ascension");
}

- (void)testFeastOfTheAscension2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 10;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Jeudi de l'Ascension");
}

- (void)testFeastOfTheAscension2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 5;
    self.dateComponents.day = 30;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Jeudi de l'Ascension");
}

- (void)testFeastOfTheAscension2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 10;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Jeudi de l'Ascension");
}

- (void)testInvalidFeastOfTheAscension2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 5;
    self.dateComponents.day = 24;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidFeastOfTheAscension2040
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 6;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Whit Monday

- (void)testWhitMonday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 6;
    self.dateComponents.day = 5;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Lundi de Pentecôte");
}

- (void)testWhitMonday2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 5;
    self.dateComponents.day = 21;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Lundi de Pentecôte");
}

- (void)testWhitMonday2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 6;
    self.dateComponents.day = 10;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Lundi de Pentecôte");
}

- (void)testWhitMonday2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 5;
    self.dateComponents.day = 21;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Lundi de Pentecôte");
}

- (void)testInvalidWhitMonday2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 6;
    self.dateComponents.day = 4;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidWhitMonday2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 7;
    self.dateComponents.day = 5;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Bastille Day

- (void)testBastilleDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête Nationale Française");
}

- (void)testBastilleDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête Nationale Française");
}

- (void)testBastilleDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête Nationale Française");
}

- (void)testBastilleDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 7;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Fête Nationale Française");
}

- (void)testInvalidBastilleDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 7;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidBastilleDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 6;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Assumption of Mary

- (void)testAssumptionOfMary2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Assomption");
}

- (void)testAssumptionOfMary2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Assomption");
}

- (void)testAssumptionOfMary2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Assomption");
}

- (void)testAssumptionOfMary2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 8;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Assomption");
}

- (void)testInvalidAssumptionOfMary2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 8;
    self.dateComponents.day = 14;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidAssumptionOfMary2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 9;
    self.dateComponents.day = 15;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - All Saints' Day

- (void)testAllSaintsDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Toussaint");
}

- (void)testAllSaintsDay2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Toussaint");
}

- (void)testAllSaintsDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Toussaint");
}

- (void)testAllSaintsDay2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 11;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Toussaint");
}

- (void)testInvalidAllSaintsDay2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 2;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidAllSaintsDay2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 10;
    self.dateComponents.day = 1;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Armistice of November 11th, 1918

- (void)test1918Armistice2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Armistice de 1918");
}

- (void)test1918Armistice2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Armistice de 1918");
}

- (void)test1918Armistice2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Armistice de 1918");
}

- (void)test1918Armistice2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 11;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Armistice de 1918");
}

- (void)testInvalid1918Armistice2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 10;
    self.dateComponents.day = 11;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalid1918Armistice2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 11;
    self.dateComponents.day = 12;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

#pragma mark - Christmas

- (void)testChristmas2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Noël");
}

- (void)testChristmas2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Noël");
}

- (void)testChristmas2019
{
    self.dateComponents.year = 2019;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Noël");
}

- (void)testChristmas2040
{
    self.dateComponents.year = 2040;
    self.dateComponents.month = 12;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertEqualObjects([date localizedHolidayName], @"Noël");
}

- (void)testInvalidChristmas2017
{
    self.dateComponents.year = 2017;
    self.dateComponents.month = 11;
    self.dateComponents.day = 25;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}

- (void)testInvalidChristmas2018
{
    self.dateComponents.year = 2018;
    self.dateComponents.month = 12;
    self.dateComponents.day = 24;
    NSDate *date = [self.calendar dateFromComponents:self.dateComponents];

    XCTAssertNil([date localizedHolidayName]);
}


@end
