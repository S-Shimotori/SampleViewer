import SwiftUI

struct GestureBasedActionView: View {
    @Environment(\.editMode) private var editMode
    @Environment(\.locale) private var locale

    @State private var items = Array(repeating: SampleItem(id: UUID()), count: 5)

    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        Text("hig.accessibility.gestures.alternative.title")
                            .font(.title)
                        Text("hig.accessibility.gestures.alternative.description")
                            .font(.body)
                    }
                }
                Section {
                    ForEach(items) { _ in
                        SampleItemView()
                    }
                    .onDelete { indexSet in
                        items.remove(atOffsets: indexSet)
                    }
                } header: {
                    Text("sample.section.title")
                }
            }
            .animation(nil, value: editMode?.wrappedValue)
            .toolbar {
                EditButton()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("sample.navigation.title")
        }
    }
}

// MARK: - SampleItem

private struct SampleItem {
    var id: UUID
}

extension SampleItem: Identifiable {}

private struct SampleItemView: View {
    var body: some View {
        HStack {
            Color.gray // instead of `AsyncImage`
                .scaledToFit()
                .frame(width: 35, height: 35)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            VStack(alignment: .leading) {
                Text("sample.title")
                    .font(.body)
                Text("sample.subtitle")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text("sample.detail")
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Xcode Preview

#Preview("GestureBasedActionView(locale=enUS)") {
    GestureBasedActionView()
        .environment(\.locale, .enUS)
}

#Preview("GestureBasedActionView(locale=jaJP)") {
    GestureBasedActionView()
        .environment(\.locale, .jaJP)
}

#Preview("SampleItemView") {
    SampleItemView()
}
