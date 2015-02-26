import XCTest

class CalendarTests: XCTestCase {
    func testDateIntervalFromDate() {
        let cal = NSCalendar(identifier: NSGregorianCalendar)!
        let date = cal.dateWithEra(1, year: 1981, month: 8, day: 4, hour: 20, minute: 0, second: 0, nanosecond: 0)!
        let calendar = Calendar(date: date)

        let from = cal.dateWithEra(1, year: 1981, month: 9, day: 10, hour: 21, minute: 0, second: 0, nanosecond: 0)!

        XCTAssertEqual(37, calendar.dateIntervalFromDate(from))
    }

    func testDateString() {
        let cal = NSCalendar(identifier: NSGregorianCalendar)!
        let date = cal.dateWithEra(1, year: 1981, month: 8, day: 4, hour: 20, minute: 0, second: 0, nanosecond: 0)!
        let calendar = Calendar(date: date)
        XCTAssertEqual("8/4/81", calendar.dateString())
    }

    func testFromString() {
        let str = "2014-08-04"
        let date = Calendar.fromString(str)
        XCTAssertEqual(date!.mt_year(), 2014)
        XCTAssertEqual(date!.mt_monthOfYear(), 8)
        XCTAssertEqual(date!.mt_dayOfMonth(), 4)
    }

    func testFromStringFail() {
        let str = "2014-08-04-"
        let date = Calendar.fromString(str)
        XCTAssertNil(date)
    }
}
