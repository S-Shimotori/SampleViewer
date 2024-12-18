import SwiftUI

struct SFSymbolWeightView: View {
    private var imageScales = [
        ImageScale(id: UUID(), scale: .small),
        ImageScale(id: UUID(), scale: .medium),
        ImageScale(id: UUID(), scale: .large),
    ]

    private var fontWeights = [
        FontWeight(
            id: UUID(),
            weight: .ultraLight,
            description: "ultraLight"
        ),
        FontWeight(
            id: UUID(),
            weight: .thin,
            description: "thin"
        ),
        FontWeight(
            id: UUID(),
            weight: .light,
            description: "light"
        ),
        FontWeight(
            id: UUID(),
            weight: .regular,
            description: "regular"
        ),
        FontWeight(
            id: UUID(),
            weight: .medium,
            description: "medium"
        ),
        FontWeight(
            id: UUID(),
            weight: .semibold,
            description: "semibold"
        ),
        FontWeight(
            id: UUID(),
            weight: .bold,
            description: "bold"
        ),
        FontWeight(
            id: UUID(),
            weight: .heavy,
            description: "heavy"
        ),
        FontWeight(
            id: UUID(),
            weight: .black,
            description: "black"
        ),
    ]

    var body: some View {
        VStack {
            Text("hig.sf-symbols.weight-and-scale.title")
                .font(.title)
            Text("hig.sf-symbols.weight-and-scale.description")
                .font(.body)

            GroupBox("hig.sf-symbols.weight-and-scale.weight.title") {
                HStack {
                    Label("Add", systemImage: "plus.circle")
                        .imageScale(.small)
                    Label("Add", systemImage: "plus.circle")
                        .imageScale(.medium)
                    Label("Add", systemImage: "plus.circle")
                        .imageScale(.large)
                }
                .frame(maxWidth: .infinity)
            }

            GroupBox("hig.sf-symbols.weight-and-scale.scale.title") {
                Grid {
                    ForEach(fontWeights) { fontWeight in
                        GridRow {
                            ForEach(imageScales) { imageScale in
                                Image(systemName: "folder.badge.plus")
                                    .imageScale(imageScale.scale)
                            }
                        }
                        .fontWeight(fontWeight.weight)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .padding()
    }
}

private struct ImageScale: Identifiable {
    var id: UUID
    var scale: Image.Scale
}

private struct FontWeight: Identifiable {
    var id: UUID
    var weight: Font.Weight
    var description: LocalizedStringKey
}

#Preview("SFSymbolWeightView(locale=enUS)") {
    SFSymbolWeightView()
        .environment(\.locale, .enUS)
}

#Preview("SFSymbolWeightView(locale=jaJP)") {
    SFSymbolWeightView()
        .environment(\.locale, .jaJP)
}
