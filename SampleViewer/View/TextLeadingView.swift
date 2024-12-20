import SwiftUI

struct TextLeadingView: View {
    private var sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    var body: some View {
        VStack {
            Text("hig.typography.leading.title")
                .font(.title)
            Text("hig.typography.leading.description")
                .font(.body)
        }
        .padding()

        ScrollView {
            GroupBox("leading.loose") {
                Text(verbatim: sampleText)
                    .font(.body.leading(.loose))
            }
            GroupBox("leading.standard") {
                Text(verbatim: sampleText)
                    .font(.body.leading(.standard))
            }
            GroupBox("leading.tight") {
                Text(verbatim: sampleText)
                    .font(.body.leading(.tight))
            }
        }
        .padding()
    }
}

// MARK: - Xcode Preview

#Preview("TextLeadingView(locale=enUS)") {
    TextLeadingView()
        .environment(\.locale, .enUS)
}

#Preview("TextLeadingView(locale=jaJP)") {
    TextLeadingView()
        .environment(\.locale, .jaJP)
}
