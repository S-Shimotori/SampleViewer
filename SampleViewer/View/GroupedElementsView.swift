import SwiftUI

struct GroupedElementsView: View {
    private let contents = [
        Content(
            id: UUID(),
            resourceName: "mangoes",
            description: "hig.accessibility.grouped.mangoes.description",
            accessibilityDescription: "hig.accessibility.grouped.mangoes.accessibility"
        ),
        Content(
            id: UUID(),
            resourceName: "artichokes",
            description: "hig.accessibility.grouped.artichokes.description",
            accessibilityDescription: "hig.accessibility.grouped.artichokes.accessibility"
        )
    ]

    var body: some View {
        VStack {
            Text("hig.accessibility.grouped.title")
                .font(.title)
            Text("hig.accessibility.grouped.description")
                .font(.body)
            HStack(alignment: .top) {
                ForEach(contents) { content in
                    VStack {
                        Image(
                            content.resourceName,
                            label: Text(content.accessibilityDescription)
                        )
                        .resizable()
                        .scaledToFit()
                        Text(content.description)
                    }
                    .accessibilityElement(children: .contain)
                }
            }
        }.padding()
    }
}

// MARK: - Content

private struct Content: Identifiable {
    var id: UUID
    var resourceName: String
    var description: LocalizedStringKey
    var accessibilityDescription: LocalizedStringKey
}

// MARK: - Xcode Preview

#Preview("GroupedElementsView(locale=enUS)") {
    GroupedElementsView()
        .environment(\.locale, .enUS)
}

#Preview("GroupedElementsView(locale=jaJP)") {
    GroupedElementsView()
        .environment(\.locale, .jaJP)
}
