import SwiftUI

struct SystemLabelView: View {
    private let appearanceBoxes = [
        AppearanceBox(
            id: UUID(),
            titleKey: "hig.dark-mode.labels.light.title",
            colorScheme: .light
        ),
        AppearanceBox(
            id: UUID(),
            titleKey: "hig.dark-mode.labels.dark.title",
            colorScheme: .dark
        ),
    ]

    var body: some View {
        VStack {
            VStack {
                Text("hig.dark-mode.labels.title")
                    .font(.title)
                Text("hig.dark-mode.labels.description")
                    .font(.body)
            }

            ForEach(appearanceBoxes) { appearanceBox in
                GroupBox(appearanceBox.titleKey) {
                    VStack {
                        Text("sample.label")
                            .foregroundStyle(Color.primary)
                        Text("sample.label")
                            .foregroundStyle(Color.secondary)
                    }
                    .padding()
                }
                .backgroundStyle(Color("dark-mode.labels.background"))
                .environment(\.colorScheme, appearanceBox.colorScheme)
            }
        }.padding()
    }
}

// MARK: - AppearanceBox

private struct AppearanceBox: Identifiable {
    var id: UUID
    var titleKey: LocalizedStringKey
    var colorScheme: ColorScheme
}

#Preview {
    SystemLabelView()
}

// MARK: - Xcode Preview

#Preview("SystemLabelView(locale=enUS,colorScheme=light)") {
    SystemLabelView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .light)
}

#Preview("SystemLabelView(locale=jaJP,colorScheme=light)") {
    SystemLabelView()
        .environment(\.locale, .jaJP)
        .environment(\.colorScheme, .light)
}

#Preview("SystemLabelView(locale=enUS,colorScheme=dark)") {
    SystemLabelView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .dark)
}
