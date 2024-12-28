import Foundation
import Testing
@testable import Localization

struct MidnightOfNextDayTest {
    @Test(
        arguments: zip(
            [1709086953/*2024-02-28T11:22:33+09:00*/, 1735657199/*2024-12-31T23:59:59+09:00*/, 1735657200/*2025-01-01T00:00:00+09:00*/, 1740672123/*2025-02-28T01:02:03+09:00*/],
            [1709132400/*2024-02-29T00:00:00+09:00*/, 1735657200/*2025-01-01T00:00:00+09:00*/, 1735743600/*2025-01-02T00:00:00+09:00*/, 1740754800/*2025-03-01T00:00:00+09:00*/]
        )
    )
    func japan(baseUNIXTime: TimeInterval, expectedUNIXTime: TimeInterval) async throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .jaJP
        calendar.timeZone = .tokyo

        let actualDate = calendar.midnightOfNextDay(from: Date(timeIntervalSince1970: baseUNIXTime))
        let expectedDate = Date(timeIntervalSince1970: expectedUNIXTime)
        #expect(actualDate == expectedDate)
    }

    @Test(
        arguments: zip(
            [1709148153/*2024-02-28T11:22:33-08:00*/, 1735718399/*2024-12-31T23:59:59-08:00*/, 1735718400/*2025-01-01T00:00:00-08:00*/, 1740733323/*2025-02-28T01:02:03-08:00*/],
            [1709193600/*2024-02-29T00:00:00-08:00*/, 1735718400/*2025-01-01T00:00:00-08:00*/, 1735804800/*2025-01-02T00:00:00-08:00*/, 1740816000/*2025-03-01T00:00:00-08:00*/]
        )
    )
    func westCoastOfUS(baseUNIXTime: TimeInterval, expectedUNIXTime: TimeInterval) async throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .enUS
        calendar.timeZone = .losAngeles

        let actualDate = calendar.midnightOfNextDay(from: Date(timeIntervalSince1970: baseUNIXTime))
        let expectedDate = Date(timeIntervalSince1970: expectedUNIXTime)
        #expect(actualDate == expectedDate)
    }
}
