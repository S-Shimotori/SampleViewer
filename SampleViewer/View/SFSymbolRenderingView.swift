import SwiftUI

/// - NOTE: `textformat.characters.dottedunderline` in Japanese language is rendered incorrectly.
struct SFSymbolRenderingView: View {
    private var symbolRenderingModeContexts = [
        SymbolRenderingModeContext(
            id: UUID(),
            symbolRenderingMode: .monochrome,
            description: "hig.sf-symbols.rendering.monochrome.description"
        ),
        SymbolRenderingModeContext(
            id: UUID(),
            symbolRenderingMode: .hierarchical,
            description: "hig.sf-symbols.rendering.hierarchical.description"
        ),
        SymbolRenderingModeContext(
            id: UUID(),
            symbolRenderingMode: .palette,
            description: "hig.sf-symbols.rendering.palette.description"
        ),
        SymbolRenderingModeContext(
            id: UUID(),
            symbolRenderingMode: .multicolor,
            description: "hig.sf-symbols.rendering.multicolor.description"
        ),
    ]

    private var sampleSFSymbols = [
        "square.and.arrow.up",
        "folder.badge.plus",
        "trash.slash",
        "calendar.day.timeline.trailing",
        "list.number",
        "textformat.characters.dottedunderline",
        "iphone.gen3.radiowaves.left.and.right",
        "pc"
    ].map {
        SampleSFSymbol(id: UUID(), systemName: $0)
    }

    var body: some View {
        VStack {
            Text("hig.sf-symbols.rendering.title")
                .font(.title)
            Text("hig.sf-symbols.rendering.description")
                .font(.body)

            GroupBox {
                HStack {
                    Image(systemName: "cloud.sun.rain.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.white, Color.gray, Color.gray)
                    Image(systemName: "cloud.sun.rain.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.gray, Color.white, Color.gray)
                    Image(systemName: "cloud.sun.rain.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.gray, Color.gray, Color.white)
                    Image(systemName: "cloud.sun.rain.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(Color.accentColor)
                }
            } label: {
                Text(verbatim: "cloud.sun.rain.fill")
            }

            GroupBox {
                HStack {
                    Image(systemName: "speaker.wave.3", variableValue: 0)
                        .foregroundStyle(Color.accentColor)
                    Image(systemName: "speaker.wave.3", variableValue: 0.3)
                        .foregroundStyle(Color.accentColor)
                    Image(systemName: "speaker.wave.3", variableValue: 0.6)
                        .foregroundStyle(Color.accentColor)
                    Image(systemName: "speaker.wave.3", variableValue: 1)
                        .foregroundStyle(Color.accentColor)
                }
            } label: {
                Text(verbatim: "speaker.wave.3")
            }

            ForEach(symbolRenderingModeContexts) { symbolRenderingModeContext in
                GroupBox {
                    HStack {
                        ForEach(sampleSFSymbols) { sampleSFSymbol in
                            Image(systemName: sampleSFSymbol.systemName)
                                .symbolRenderingMode(symbolRenderingModeContext.symbolRenderingMode)
                                .foregroundStyle(Color.accentColor, Color.gray)
                        }
                    }
                } label: {
                    Text(symbolRenderingModeContext.description)
                }
            }
        }.padding()
    }
}

private struct SampleSFSymbol: Identifiable {
    var id: UUID
    var systemName: String
}

private struct SymbolRenderingModeContext: Identifiable {
    var id: UUID
    var symbolRenderingMode: SymbolRenderingMode
    var description: LocalizedStringKey
}

// MARK: - Xcode Preview

#Preview("SFSymbolRenderingView(locale=enUS,colorScheme=light)") {
    SFSymbolRenderingView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .light)
}

#Preview("SFSymbolRenderingView(locale=enUS,colorScheme=dark)") {
    SFSymbolRenderingView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .dark)
}

#Preview("SFSymbolRenderingView(locale=jaJP,colorScheme=light)") {
    SFSymbolRenderingView()
        .environment(\.locale, .jaJP)
        .environment(\.colorScheme, .light)
}

#Preview("SFSymbolRenderingView(locale=jaJP,colorScheme=dark)") {
    SFSymbolRenderingView()
        .environment(\.locale, .jaJP)
        .environment(\.colorScheme, .dark)
}
