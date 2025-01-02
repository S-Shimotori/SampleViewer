import SwiftUI

struct DataYouNeedView: View {
    @Binding
    private var email: String

    @Binding
    private var message: String

    init() {
        _email = .constant("")
        // FIXME: Localize initial text
        _message = .constant(String(localized: "sample.hello-world"))
    }

    var body: some View {
        VStack {
            Text("hig.entering-data.data-you-need.title")
                .font(.title)
            // FIXME: Disable adding a link to the email address
            Text("hig.entering-data.data-you-need.description")
                .font(.body)
        }
        .padding()

        Form {
            Section("hig.entering-data.data-you-need.email.label") {
                TextField(
                    "hig.entering-data.data-you-need.email.label",
                    text: $email,
                    prompt: Text(verbatim: "username@company.com")
                )
            }

            Section("hig.entering-data.data-you-need.message.label") {
                TextField(
                    "hig.entering-data.data-you-need.message.label",
                    text: $message,
                    prompt: Text("sample.hello-world")
                )
            }
        }
    }
}

// MARK: - Xcode Preview

#Preview("DataYouNeedView(locale=enUS)") {
    DataYouNeedView()
        .environment(\.locale, .enUS)
}

#Preview("DataYouNeedView(locale=jaJP)") {
    DataYouNeedView()
        .environment(\.locale, .jaJP)
}
