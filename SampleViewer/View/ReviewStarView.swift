import SwiftUI
import Localization

struct ReviewStarView: View {
    private var rating = 3.5

    private var contexts = [
        Context(
            id: UUID(),
            locale: .enUS,
            layoutDirection: .leftToRight,
            description: "locale.en_US"
        ),
        Context(
            id: UUID(),
            locale: .jaJP,
            layoutDirection: .leftToRight,
            description: "locale.ja_JP"
        ),
        Context(
            id: UUID(),
            locale: .arSA,
            layoutDirection: .rightToLeft,
            description: "locale.ar_SA"
        ),
        Context(
            id: UUID(),
            locale: .heIL,
            layoutDirection: .rightToLeft,
            description: "locale.he_IL"
        ),
        Context(
            id: UUID(),
            locale: .arAE,
            layoutDirection: .rightToLeft,
            description: "locale.ar_AE"
        ),
    ]

    var body: some View {
        VStack {
            Text("hig.right-to-left.rating.title")
                .font(.title)
            Text("hig.right-to-left.rating.description")
                .font(.body)

            ScrollView {
                ForEach(contexts) { context in
                    GroupBox(context.description) {
                        HStack {
                            ForEach(1 ..< 6) { value in
                                VStack {
                                    starImage(value: Double(value))
                                    Text(verbatim: localizedPositiveNumber(value, locale: context.locale) ?? "")
                                }
                            }
                        }
                        .padding()
                        .environment(\.locale, context.locale)
                        .environment(\.layoutDirection, context.layoutDirection)
                    }
                }
            }
        }
        .padding()
    }

    private func starImage(value: Double) -> Image {
        if Double(value) <= rating {
            Image(systemName: "star.fill")
        }
        else if Double(value) - rating <= 0.5 {
            Image(systemName: "star.leadinghalf.filled")
        }
        else {
            Image(systemName: "star")
        }
    }
}

// MARK: - Context

private struct Context: Identifiable {
    var id: UUID
    var locale: Locale
    var layoutDirection: LayoutDirection
    var description: LocalizedStringKey
}

// MARK: - Xcode Preview

#Preview("ReviewStarView(locale=enUS)") {
    ReviewStarView()
        .environment(\.locale, .enUS)
}

#Preview("ReviewStarView(locale=jaJP)") {
    ReviewStarView()
        .environment(\.locale, .jaJP)
}
