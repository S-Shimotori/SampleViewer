import Foundation
import Testing
@testable import Localization

struct TimeZoneTest {
    @Test
    func constants() async throws {
        let timeZones: [TimeZone] = [
            .tokyo,
            .losAngeles,
        ]
        #expect(timeZones.allSatisfy { TimeZone.knownTimeZoneIdentifiers.contains($0.identifier) })
    }
}
