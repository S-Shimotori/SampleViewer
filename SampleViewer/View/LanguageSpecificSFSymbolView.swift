import SwiftUI

struct LanguageSpecificSFSymbolView: View {
    private var languages = [
        Language(
            id: UUID(),
            locale: .enUS,
            description: "locale.en_US"
        ),
        Language(
            id: UUID(),
            locale: .arAE,
            description: "locale.ar_AE"
        ),
        Language(
            id: UUID(),
            locale: .heIL,
            description: "locale.he_IL"
        ),
        Language(
            id: UUID(),
            locale: .hiIN,
            description: "locale.hi_IN"
        ),
        Language(
            id: UUID(),
            locale: .thTH,
            description: "locale.th_TH"
        ),
        Language(
            id: UUID(),
            locale: .zhCN,
            description: "locale.zh_CN"
        ),
        Language(
            id: UUID(),
            locale: .jaJP,
            description: "locale.ja_JP"
        ),
        Language(
            id: UUID(),
            locale: .koKR,
            description: "locale.ko_KR"
        ),
    ]

    var body: some View {
        NavigationStack {
            Text("hig.sf-symbols.variant.language-specific.description")
                .font(.body)

            ScrollView {
                ForEach(languages) { language in
                    GroupBox(language.description) {
                        HStack {
                            Image(systemName: "richtext.page")
                            Image(systemName: "richtext.page.fill")
                            Image(systemName: "character.book.closed")
                            Image(systemName: "character.book.closed.fill")
                            Image(systemName: "character.bubble")
                            Image(systemName: "character.bubble.fill")
                            Image(systemName: "character")
                            Image(systemName: "textformat.superscript")
                            Image(systemName: "textformat.subscript")
                            Image(systemName: "textformat.size")
                            Image(systemName: "character.textbox")
                            Image(systemName: "character.cursor.ibeam")
                        }
                        .environment(\.locale, language.locale)
                    }
                }
            }
            .navigationBarTitle(
                "hig.sf-symbols.variant.language-specific.title",
                displayMode: .inline
            )
        }
        .padding()
    }
}

private struct Language: Identifiable {
    var id: UUID
    var locale: Locale
    var description: LocalizedStringKey
}

// MARK: - Xcode Preview

#Preview("LanguageSpecificSFSymbolView(locale=enUS)") {
    LanguageSpecificSFSymbolView()
        .environment(\.locale, .enUS)
}

#Preview("LanguageSpecificSFSymbolView(locale=jaJP)") {
    LanguageSpecificSFSymbolView()
        .environment(\.locale, .jaJP)
}
