import SwiftUI

struct NumberSystemView: View {
    private var localeConfigurations = [
        LocaleConfiguration(
            id: UUID(),
            locale: .enUS,
            description: "locale.en_US"
        ),
        LocaleConfiguration(
            id: UUID(),
            locale: .arSA,
            description: "locale.ar_SA"
        ),
        LocaleConfiguration(
            id: UUID(),
            locale: .arAE,
            description: "locale.ar_AE"
        ),
    ]

    private var date: Date

    init(date: Date) {
        self.date = date
    }

    var body: some View {
        VStack {
            Text("hig.right-to-left.number-system.title")
                .font(.title)
            Text("hig.right-to-left.number-system.description")
                .font(.body)

            ForEach(localeConfigurations) { localeConfiguration in
                GroupBox(localeConfiguration.description) {
                    Text(date, format: Date.FormatStyle(date: .numeric, time: .omitted))
                        .padding()
                }
                .environment(\.locale, localeConfiguration.locale)
            }
        }
        .padding()
    }
}

// MARK: - LocaleConfiguration

private struct LocaleConfiguration: Identifiable {
    var id: UUID
    var locale: Locale
    var description: LocalizedStringKey
}

// MARK: - Xcode Preview

#Preview("NumberSystemView(locale=enUS)") {
    NumberSystemView(date: .now)
        .environment(\.locale, .enUS)
}

#Preview("NumberSystemView(locale=jaJP)") {
    NumberSystemView(date: .now)
        .environment(\.locale, .jaJP)
}
