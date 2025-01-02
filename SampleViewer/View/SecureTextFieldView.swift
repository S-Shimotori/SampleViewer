import SwiftUI

struct SecureTextFieldView: View {
    @Binding
    private var secureFieldText: String

    init() {
        _secureFieldText = .constant("")
    }

    var body: some View {
        VStack {
            Text("hig.entering-data.secure-field.title")
                .font(.title)
            Text("hig.entering-data.secure-field.description")
                .font(.body)
        }
        .padding()

        VStack {
            SecureField(
                "hig.entering-data.secure-field.password.label",
                text: $secureFieldText
            )
        }
        .padding()
    }
}

// MARK: - Xcode Preview

#Preview("SecureTextFieldView(locale=enUS)") {
    SecureTextFieldView()
        .environment(\.locale, .enUS)
}

#Preview("SecureTextFieldView(locale=jaJP)") {
    SecureTextFieldView()
        .environment(\.locale, .jaJP)
}
