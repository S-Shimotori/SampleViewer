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
            Text("hig.typography.size.largeTitle.description")
                .font(.largeTitle)
            Text("hig.typography.size.title.description")
                .font(.title)
            Text("hig.typography.size.title2.description")
                .font(.title2)
            Text("hig.typography.size.title3.description")
                .font(.title3)
            Text("hig.typography.size.headline.description")
                .font(.headline)
            Text("hig.typography.size.subheadline.description")
                .font(.subheadline)
            Text("hig.typography.size.body.description")
                .font(.body)
            Text("hig.typography.size.callout.description")
                .font(.callout)
            Text("hig.typography.size.footnote.description")
                .font(.footnote)
            Text("hig.typography.size.caption.description")
                .font(.caption)
            Text("hig.typography.size.caption2.description")
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
