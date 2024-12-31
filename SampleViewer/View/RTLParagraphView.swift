import SwiftUI

struct RTLParagraphView: View {

    private let englishText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"

    // TODO: Use a correct Arabic sample text
    private let arabicText = "أبجد هوز حطي كلمن سعفص قرشت ثخذ ضظغ أبجد هوز حطي كلمن سعفص قرشت ثخذ ضظغ أبجد هوز حطي كلمن سعفص قرشت ثخذ ضظغ أبجد هوز حطي كلمن سعفص قرشت ثخذ ضظغ أبجد هوز حطي كلمن سعفص قرشت ثخذ ضظغ\n"

    var body: some View {
        VStack {
            Text("hig.right-to-left.paragraph.title")
                .font(.title)
            Text("hig.right-to-left.paragraph.description")
                .font(.body)
        }
        .padding()

        GroupBox(
            label: Label(
                "hig.right-to-left.paragraph.section.uikit",
                systemImage: "square.stack.3d.up"
            )
        ) {
            AttributedLabel(
                attributedText:
                    attributedString(from: englishText, alignment: .left)
                + attributedString(from: arabicText, alignment: .right)
            )
        }
        .padding()

        // TODO: Use `ScrollView`
        // TODO: Use SwiftUI
    }

    private func attributedString(from text: String, alignment: NSTextAlignment) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        return NSAttributedString(string: text, attributes: [.paragraphStyle: paragraphStyle])
    }
}

private func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    let base = NSMutableAttributedString(attributedString: lhs)
    base.append(rhs)
    return base
}

private struct AttributedLabel: UIViewRepresentable {
    private var attributedText: NSAttributedString

    init(attributedText: NSAttributedString) {
        self.attributedText = attributedText
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let label = UILabel()
        label.attributedText = attributedText
        label.numberOfLines = 0
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // TODO: Calculate height
    }
}

// MARK: - Xcode Preview

#Preview("RTLParagraphView(locale=enUS,layoutDirection=leftToRight)") {
    RTLParagraphView()
        .environment(\.locale, .enUS)
        .environment(\.layoutDirection, .leftToRight)
}

#Preview("RTLParagraphView(locale=jaJP,layoutDirection=leftToRight)") {
    RTLParagraphView()
        .environment(\.locale, .jaJP)
        .environment(\.layoutDirection, .leftToRight)
}

#Preview("RTLParagraphView(locale=enUS,layoutDirection=rightToLeft)") {
    RTLParagraphView()
        .environment(\.locale, .enUS)
        .environment(\.layoutDirection, .rightToLeft)
}
