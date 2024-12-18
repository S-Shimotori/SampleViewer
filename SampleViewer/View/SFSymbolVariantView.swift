import SwiftUI

struct SFSymbolVariantView: View {
    var body: some View {
        VStack {
            Text("hig.sf-symbols.variant.title")
                .font(.title)
            Text("hig.sf-symbols.variant.description")
                .font(.body)
        }
        .padding()

        HStack {
            Image(systemName: "heart")
            Image(systemName: "heart")
                .symbolVariant(.slash)
            Image(systemName: "heart")
                .symbolVariant(.circle)
            Image(systemName: "heart")
                .symbolVariant(.square)
            Image(systemName: "heart")
                .symbolVariant(.rectangle)
        }

        HStack {
            Image(systemName: "heart")
                .symbolVariant(.fill)
            Image(systemName: "heart")
                .symbolVariant(.fill)
                .symbolVariant(.slash)
            Image(systemName: "heart")
                .symbolVariant(.fill)
                .symbolVariant(.circle)
            Image(systemName: "heart")
                .symbolVariant(.fill)
                .symbolVariant(.square)
            Image(systemName: "heart")
                .symbolVariant(.fill)
                .symbolVariant(.rectangle)
        }
    }
}

// MARK: - Xcode Preview

#Preview("SFSymbolVariantView(locale=enUS)") {
    SFSymbolVariantView()
        .environment(\.locale, .enUS)
}

#Preview("SFSymbolVariantView(locale=jaJP)") {
    SFSymbolVariantView()
        .environment(\.locale, .jaJP)
}
