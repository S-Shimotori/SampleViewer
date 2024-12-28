import Foundation
import Testing
@testable import Localization

struct MidnightOfTodayTest {
    @Test(
        arguments: zip(
            [1735657200/*2025-01-01T00:00:00+09:00*/, 1735698153/*2025-01-01T11:22:33+09:00*/],
            [1735657200/*2025-01-01T00:00:00+09:00*/, 1735657200/*2025-01-01T00:00:00+09:00*/]
        )
    )
    func japan(baseUNIXTime: TimeInterval, expectedUNIXTime: TimeInterval) async throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .jaJP
        calendar.timeZone = .tokyo

        let actualDate = calendar.midnightOfToday(from: Date(timeIntervalSince1970: baseUNIXTime))
        let expectedDate = Date(timeIntervalSince1970: expectedUNIXTime)
        #expect(actualDate == expectedDate)
    }

    @Test(
        arguments: zip(
            [1735718400/*2025-01-01T00:00:00-08:00*/, 1735759353/*2025-01-01T11:22:33-08:00*/],
            [1735718400/*2025-01-01T00:00:00-08:00*/, 1735718400/*2025-01-01T00:00:00-08:00*/]
        )
    )
    func westCoastOfUS(baseUNIXTime: TimeInterval, expectedUNIXTime: TimeInterval) async throws {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = .enUS
        calendar.timeZone = .losAngeles

        let actualDate = calendar.midnightOfToday(from: Date(timeIntervalSince1970: baseUNIXTime))
        let expectedDate = Date(timeIntervalSince1970: expectedUNIXTime)
        #expect(actualDate == expectedDate)
    }
}
