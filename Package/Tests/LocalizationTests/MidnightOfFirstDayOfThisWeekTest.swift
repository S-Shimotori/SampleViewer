import Foundation
import Testing
@testable import Localization

struct MidnightOfFirstDayOfThisWeekTest {
    @Test(
        arguments: zip(
            [1735398000/*2024-12-29T00:00:00+09:00*/, 1736002799/*2025-01-04T23:59:59+09:00*/, 1736002800/*2025-01-05T00:00:00+09:00*/],
            [1735398000/*2024-12-29T00:00:00+09:00*/, 1735398000/*2024-12-29T00:00:00+09:00*/, 1736002800/*2025-01-05T00:00:00+09:00*/]
        )
    )
    func beginOnSunday(baseUNIXTime: TimeInterval, expectedUNIXTime: TimeInterval) async throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .jaJP
        calendar.timeZone = .tokyo
        calendar.firstWeekday = 1 /*Sunday*/

        let actualDate = calendar.midnightOfFirstDayOfThisWeek(from: Date(timeIntervalSince1970: baseUNIXTime))
        let expectedDate = Date(timeIntervalSince1970: expectedUNIXTime)
        #expect(actualDate == expectedDate)
    }

    @Test(
        arguments: zip(
            [1735484400/*2024-12-30T00:00:00+09:00*/, 1736089199/*2025-01-05T23:59:59+09:00*/, 1736089200/*2025-01-06T00:00:00+09:00*/],
            [1735484400/*2024-12-30T00:00:00+09:00*/, 1735484400/*2024-12-30T00:00:00+09:00*/, 1736089200/*2025-01-06T00:00:00+09:00*/]
        )
    )
    func beginOnMonday(baseUNIXTime: TimeInterval, expectedUNIXTime: TimeInterval) async throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .jaJP
        calendar.timeZone = .tokyo
        calendar.firstWeekday = 2 /*Monday*/

        let actualDate = calendar.midnightOfFirstDayOfThisWeek(from: Date(timeIntervalSince1970: baseUNIXTime))
        let expectedDate = Date(timeIntervalSince1970: expectedUNIXTime)
        #expect(actualDate == expectedDate)
    }

    @Test(
        arguments: zip(
            [1735372800/*2024-12-28T00:00:00-08:00*/, 1735977599/*2025-01-03T23:59:59-08:00*/, 1735977600/*2025-01-04T00:00:00-08:00*/],
            [1735372800/*2024-12-28T00:00:00-08:00*/, 1735372800/*2024-12-28T00:00:00-08:00*/, 1735977600/*2025-01-04T00:00:00-08:00*/]
        )
    )
    func beginOnSaturday(baseUNIXTime: TimeInterval, expectedUNIXTime: TimeInterval) async throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .enUS
        calendar.timeZone = .losAngeles
        calendar.firstWeekday = 7 /*Saturday*/

        let actualDate = calendar.midnightOfFirstDayOfThisWeek(from: Date(timeIntervalSince1970: baseUNIXTime))
        let expectedDate = Date(timeIntervalSince1970: expectedUNIXTime)
        #expect(actualDate == expectedDate)
    }
}
