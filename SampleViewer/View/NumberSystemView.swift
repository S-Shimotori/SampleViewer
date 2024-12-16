import SwiftUI

struct NumberSystemView: View {
    private var localeConfigurations = [
        LocaleConfiguration(
            id: UUID(),
            locale: "en_US",
            description: "hig.right-to-left.number-system.en_US.title"
        ),
        LocaleConfiguration(
            id: UUID(),
            locale: "ar_SA",
            description: "hig.right-to-left.number-system.ar_SA.title"
        ),
        LocaleConfiguration(
            id: UUID(),
            locale: "ar_AE",
            description: "hig.right-to-left.number-system.ar_AE.title"
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
                .environment(\.locale, .init(identifier: localeConfiguration.locale))
            }
        }
        .padding()
    }
}

// MARK: - LocaleConfiguration

private struct LocaleConfiguration: Identifiable {
    var id: UUID
    var locale: String
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
