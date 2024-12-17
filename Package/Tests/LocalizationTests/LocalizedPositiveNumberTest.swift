import Foundation
import Testing
@testable import Localization

struct LocalizedPositiveNumberTest {
    @Test(
        arguments: zip(
            (1 ... 9) + [12, 234, 4567],
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "12", "234", "4567"]
        )
    )
    func westernArabicNumerals(inputtedDigit: Int, expectedDigit: String) async throws {
        let locales = [Locale.enUS, Locale.jaJP, Locale.arAE, Locale.heIL]

        for locale in locales {
            let actualDigit = localizedPositiveNumber(inputtedDigit, locale: locale)
            #expect(actualDigit == expectedDigit)
        }
    }

    @Test(
        arguments: zip(
            (1 ... 9) + [12, 234, 4567],
            ["١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩", "١٢", "٢٣٤", "٤٥٦٧"]
        )
    )
    func easternArabicNumerals(inputtedDigit: Int, expectedDigit: String) async throws {
        let locales = [Locale.arSA]

        for locale in locales {
            let actualDigit = localizedPositiveNumber(inputtedDigit, locale: locale)
            #expect(actualDigit == expectedDigit)
        }
    }

    @Test(
        arguments: [-1, 0]
    )
    func invalid(inputtedDigit: Int) async throws {
        let actualDigit = localizedPositiveNumber(inputtedDigit, locale: .enUS)
        #expect(actualDigit == nil)
    }
}
