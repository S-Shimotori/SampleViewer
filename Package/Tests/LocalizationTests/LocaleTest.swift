import Foundation
import Testing
@testable import Localization

struct LocaleTest {
    @Test
    func constants() async throws {
        let locales: [Locale] = [
            .jaJP,
            .enUS,
            .arAE,
            .arSA,
            .heIL,
        ]
        #expect(locales.allSatisfy { Locale.availableIdentifiers.contains($0.identifier) })
    }

}
