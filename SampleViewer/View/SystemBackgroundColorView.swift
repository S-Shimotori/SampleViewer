import SwiftUI

struct SystemBackgroundColorView: View {
    @Environment(\.userInterfaceLevel)
    private var userInterfaceLevel: UIUserInterfaceLevel

    @State
    private var isPresented = false

    private let appearanceBoxes = [
        AppearanceBox(
            id: UUID(),
            titleKey: { _ in "hig.dark-mode.system.light.title" },
            colorScheme: .light
        ),
        AppearanceBox(
            id: UUID(),
            titleKey: {
                $0 == .elevated
                    ? "hig.dark-mode.system.elevated.title"
                    : "hig.dark-mode.system.base.title"
            },
            colorScheme: .dark
        ),
    ]

    var body: some View {
        VStack {
            Text("hig.dark-mode.system.title")
                .font(.title)
            Text("hig.dark-mode.system.description")
                .font(.body)
        }
        .padding()

        Button {
            isPresented.toggle()
        } label: {
            Text("hig.dark-mode.system.button.title")
        }
        .sheet(isPresented: $isPresented) {
            SystemBackgroundColorView()
        }

        VStack {
            ForEach(appearanceBoxes) { appearanceBox in
                GroupBox(appearanceBox.titleKey(userInterfaceLevel)) {
                    VStack {
                        Text(verbatim: "label")
                            .foregroundStyle(Color(uiColor: UIColor.label))
                        Text(verbatim: "secondaryLabel")
                            .foregroundStyle(Color(uiColor: UIColor.secondaryLabel))
                        Text(verbatim: "tertiaryLabel")
                            .foregroundStyle(Color(uiColor: UIColor.tertiaryLabel))
                        Text(verbatim: "quaternaryLabel")
                            .foregroundStyle(Color(uiColor: UIColor.quaternaryLabel))
                    }
                    .padding()
                }
                .backgroundStyle(Color(uiColor: UIColor.systemBackground))
                .environment(\.colorScheme, appearanceBox.colorScheme)
            }
        }
        .padding()
    }
}

// MARK: - AppearanceBox

private struct AppearanceBox: Identifiable {
    var id: UUID
    var titleKey: (UIUserInterfaceLevel) -> LocalizedStringKey
    var colorScheme: ColorScheme
}

// MARK: - Xcode Preview

#Preview("SystemBackgroundColorView(locale=enUS,colorScheme=light)") {
    SystemBackgroundColorView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .light)
}

#Preview("SystemBackgroundColorView(locale=enUS,colorScheme=dark)") {
    SystemBackgroundColorView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .dark)
}

#Preview("SystemBackgroundColorView(locale=jaJP,colorScheme=light)") {
    SystemBackgroundColorView()
        .environment(\.locale, .jaJP)
        .environment(\.colorScheme, .light)
}
