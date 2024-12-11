import SwiftUI
import Localization

struct RelativeImportanceView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("hig.accessibility.controls.configuration.title")
                    .font(.title)
                Text("hig.accessibility.controls.configuration.description")
                    .font(.body)
            }

            GroupBox(
                label: Label(
                    "hig.accessibility.controls.configuration.section.swiftui",
                    systemImage: "swift"
                )
            ) {
                VStack {
                    // TODO: Refactor
                    // We cannot create an array for `buttonStyle<S>(_:)`
                    // because there are different types of button style protocols.

                    Button {
                    } label: {
                        Text(verbatim: "PrimitiveButtonStyle.plain")
                            .frame(maxWidth: .infinity, maxHeight: Layout.heightOfButton)
                    }
                    .buttonStyle(.plain)

                    Button {
                    } label: {
                        Text(verbatim: "PrimitiveButtonStyle.automatic")
                            .frame(maxWidth: .infinity, maxHeight: Layout.heightOfButton)
                    }
                    .buttonStyle(.automatic)

                    Button {
                    } label: {
                        Text(verbatim: "PrimitiveButtonStyle.bordered")
                            .frame(maxWidth: .infinity, maxHeight: Layout.heightOfButton)
                    }
                    .buttonStyle(.bordered)

                    Button {
                    } label: {
                        Text(verbatim: "PrimitiveButtonStyle.borderedProminent")
                            .frame(maxWidth: .infinity, maxHeight: Layout.heightOfButton)
                    }
                    .buttonStyle(.borderedProminent)

                    Button {
                    } label: {
                        Text(verbatim: "PrimitiveButtonStyle.borderless")
                            .frame(maxWidth: .infinity, maxHeight: Layout.heightOfButton)
                    }
                    .buttonStyle(.borderless)
                }
                .padding()
            }

            GroupBox(
                label: Label(
                    "hig.accessibility.controls.configuration.section.uikit",
                    systemImage: "square.stack.3d.up"
                )
            ) {
                VStack {
                    ForEach(RelativeImportanceView.uiKitButtonConfigurations, id: \.id) {
                        ConfiguredUIKitButton(configuration: $0.configuration)
                            .frame(maxWidth: .infinity, maxHeight: Layout.heightOfButton)
                    }
                }
            }
        }
    }
}

extension RelativeImportanceView {
    private enum Layout {
        static let heightOfButton = CGFloat(50)
    }

    private struct UIKitButtonConfiguration {
        let id = UUID()
        let configuration: UIButton.Configuration
    }

    private static let uiKitButtonConfigurations: [UIKitButtonConfiguration] = [
        .init(configuration: {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "UIButton.Configuration.plain"
            return configuration
        }()),
        .init(configuration: {
            var configuration = UIButton.Configuration.gray()
            configuration.title = "UIButton.Configuration.gray"
            return configuration
        }()),
        .init(configuration: {
            var configuration = UIButton.Configuration.tinted()
            configuration.title = "UIButton.Configuration.tinted"
            return configuration
        }()),
        .init(configuration: {
            var configuration = UIButton.Configuration.filled()
            configuration.title = "UIButton.Configuration.filled"
            return configuration
        }()),
        .init(configuration: {
            var configuration = UIButton.Configuration.borderless()
            configuration.title = "UIButton.Configuration.borderless"
            return configuration
        }()),
        .init(configuration: {
            var configuration = UIButton.Configuration.bordered()
            configuration.title = "UIButton.Configuration.bordered"
            return configuration
        }()),
        .init(configuration: {
            var configuration = UIButton.Configuration.borderedTinted()
            configuration.title = "UIButton.Configuration.borderedTinted"
            return configuration
        }()),
        .init(configuration: {
            var configuration = UIButton.Configuration.borderedProminent()
            configuration.title = "UIButton.Configuration.borderedProminent"
            return configuration
        }()),
    ]

}

// MARK: - ConfiguredUIButton

private struct ConfiguredUIKitButton {
    private let configuration: UIButton.Configuration

    init(
        configuration: UIButton.Configuration
    ) {
        self.configuration = configuration
    }
}

extension ConfiguredUIKitButton: UIViewRepresentable {
    func makeUIView(context: Context) -> UIButton {
        UIButton(configuration: configuration)
    }

    func updateUIView(_ uiView: UIButton, context: Context) {}
}

// MARK: - Xcode Preview

#Preview("RelativeImportanceView(locale=enUS)") {
    RelativeImportanceView()
        .environment(\.locale, .enUS)
}

#Preview("RelativeImportanceView(locale=jaJP)") {
    RelativeImportanceView()
        .environment(\.locale, .jaJP)
}
