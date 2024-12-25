import SwiftUI

struct ShareLinkView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("hig.collaboration-and-sharing.link.title")
                    .font(.title)
                Text("hig.collaboration-and-sharing.link.description")
                    .font(.body)
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "person.crop.circle.badge.checkmark")
                            .foregroundStyle(Color.yellow)
                    }
                    .disabled(true)
                    if let url = URL(string: "https://developer.apple.com/xcode/swiftui/") {
                        ShareLink(item: url) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(Color.yellow)
                        }
                    }
                    else {
                        Button {
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(Color.yellow)
                        }
                        .disabled(true)
                    }

                    Button {
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(Color.yellow)
                    }
                    .disabled(true)
                }
            }
        }
    }
}

// MARK: - Xcode Preview

#Preview("ShareLinkView(locale=enUS)") {
    ShareLinkView()
        .environment(\.locale, .enUS)
}

#Preview("ShareLinkView(locale=jaJP)") {
    ShareLinkView()
        .environment(\.locale, .jaJP)
}
