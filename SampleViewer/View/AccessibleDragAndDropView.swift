import SwiftUI

struct AccessibleDragAndDropView: View {
    @State
    private var droppedString: String?

    @State
    private var inputtedString = ""

    var body: some View {
        VStack {
            Text("hig.drag-and-drop.accessibility.title")
                .font(.title)
            Text("hig.drag-and-drop.accessibility.description")
                .font(.body)
        }
        .padding()

        // TODO: Support VoiceOver
        VStack {
            TextField("hig.drag-and-drop.accessibility.field.placeholder", text: $inputtedString)
            .textFieldStyle(.roundedBorder)
            .padding()
            .draggable(inputtedString) {
                Text(inputtedString)
            }

            dropDestinationView()
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .dropDestination(for: String.self) { items, location in
                droppedString = items.first
                return true
            }
        }
        .padding()
    }

    private func dropDestinationView() -> Text {
        if let droppedString {
            Text(droppedString)
        }
        else {
            Text("hig.drag-and-drop.accessibility.drop.description")
        }
    }
}

// MARK: - Xcode Previews

#Preview("AccessibleDragAndDropView(locale=enUS)") {
    AccessibleDragAndDropView()
        .environment(\.locale, .enUS)
}

#Preview("AccessibleDragAndDropView(locale=jaJP)") {
    AccessibleDragAndDropView()
        .environment(\.locale, .jaJP)
}
