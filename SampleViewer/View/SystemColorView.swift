import SwiftUI

struct SystemColorView: View {
    private let cornerRadius = CGFloat(5)

    private let appearanceBoxes = [
        AppearanceBox(
            id: UUID(),
            titleKey: "hig.dark-mode.colors.light.title",
            colorScheme: .light
        ),
        AppearanceBox(
            id: UUID(),
            titleKey: "hig.dark-mode.colors.dark.title",
            colorScheme: .dark
        ),
    ]

    var body: some View {
        VStack {
            VStack {
                Text("hig.dark-mode.colors.title")
                    .font(.title)
                Text("hig.dark-mode.colors.description")
                    .font(.body)
            }

            ForEach(appearanceBoxes) { appearanceBox in
                GroupBox(appearanceBox.titleKey) {
                    Grid {
                        GridRow {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(Color.blue)
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(Color.green)
                        }
                        GridRow {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(Color.indigo)
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(Color.purple)
                        }
                    }
                }
                .backgroundStyle(Color("dark-mode.colors.background"))
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

// MARK: - Xcode Preview

#Preview("SystemColorView(locale=enUS,colorScheme=light)") {
    SystemColorView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .light)
}

#Preview("SystemColorView(locale=jaJP,colorScheme=light)") {
    SystemColorView()
        .environment(\.locale, .jaJP)
        .environment(\.colorScheme, .light)
}

#Preview("SystemColorView(locale=enUS,colorScheme=dark)") {
    SystemColorView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .dark)
}
