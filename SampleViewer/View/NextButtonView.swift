import SwiftUI

struct NextButtonView: View {
    @State
    private var name = ""

    var body: some View {
        VStack {
            Text("hig.entering-data.next.title")
                .font(.title)
            Text("hig.entering-data.next.description")
                .font(.body)
        }
        .padding()

        VStack {
                TextField("hig.entering-data.next.field.label", text: $name)
                Button {
                } label: {
                    Text("hig.entering-data.next.button.label")
                }
                .disabled(name.isEmpty)
                .buttonStyle(.bordered)
        }
        .padding()
    }
}

// MARK: - Xcode Preview

#Preview("NextButtonView(locale=enUS)") {
    NextButtonView()
        .environment(\.locale, .enUS)
}

#Preview("NextButtonView(locale=jaJP)") {
    NextButtonView()
        .environment(\.locale, .jaJP)
}
