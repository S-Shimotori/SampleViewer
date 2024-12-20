import SwiftUI

struct FontSizeView: View {
    var body: some View {
        VStack {
            Text("hig.typography.size.title")
                .font(.title)
            Text("hig.typography.size.description")
                .font(.system(size: 11))
        }
        .padding()

        VStack {
            Text(verbatim: "title")
                .font(.title)
            Text(verbatim: "title2")
                .font(.title2)
            Text(verbatim: "title3")
                .font(.title3)
            Text(verbatim: "headline")
                .font(.headline)
            Text(verbatim: "subheadline")
                .font(.subheadline)
            Text(verbatim: "body")
                .font(.body)
            Text(verbatim: "callout")
                .font(.callout)
            Text(verbatim: "footnote")
                .font(.footnote)
            Text(verbatim: "caption")
                .font(.caption)
            Text(verbatim: "caption2")
                .font(.caption2)
        }
        .padding()
    }
}

// MARK: - Xcode Preview

#Preview("FontSizeView(locale=enUS)") {
    FontSizeView()
        .environment(\.locale, .enUS)
}

#Preview("FontSizeView(locale=jaJP)") {
    FontSizeView()
        .environment(\.locale, .jaJP)
}
