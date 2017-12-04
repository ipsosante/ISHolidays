
#import <Foundation/Foundation.h>

// Easter calculation, ported from the Python dateutil project
// https://github.com/dateutil/dateutil
//
// See https://github.com/dateutil/dateutil/blob/master/dateutil/easter.py for the easter implementation in dateutils

NS_ASSUME_NONNULL_BEGIN

/// This class offers a generic easter computing method for any given year
@interface ISEaster : NSObject

/// Calculate the easter date for the passed `year`.
///
/// This method was ported from the work done by GM Arts, on top of the algorithm by Claus Tondering, which was
/// based in part on the algorithm of Ouding (1940), as quoted in "Explanatory Supplement to the Astronomical
/// Almanac", P.  Kenneth Seidelmann, editor.
///
/// Unlike the dateutil implementation, the only method used here is the Western method, as NSCalendar does not
/// supports Julian and Orthodox calendars.
///
/// More about the algorithm may be found at:
///
/// http://users.chariot.net.au/~gmarts/eastalg.htm
///
/// and
///
/// http://www.tondering.dk/claus/calendar.html
+ (NSDate *)easterForYear:(NSInteger)year;

@end

NS_ASSUME_NONNULL_END
