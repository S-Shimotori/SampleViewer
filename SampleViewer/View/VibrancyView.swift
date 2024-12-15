import SwiftUI

struct VibrancyView: View {
    private let labelVibrancies = [
        LabelVibrancy(
            id: UUID(),
            vibrancyEffectStyle: .label,
            description: "hig.materials.ios.vibrancy.defaultLabel.description"
        ),
        LabelVibrancy(
            id: UUID(),
            vibrancyEffectStyle: .secondaryLabel,
            description: "hig.materials.ios.vibrancy.secondaryLabel.description"
        ),
        LabelVibrancy(
            id: UUID(),
            vibrancyEffectStyle: .tertiaryLabel,
            description: "hig.materials.ios.vibrancy.tertiaryLabel.description"
        ),
        LabelVibrancy(
            id: UUID(),
            vibrancyEffectStyle: .quaternaryLabel,
            description: "hig.materials.ios.vibrancy.quaternaryLabel.description"
        ),
    ]

    var body: some View {
        VStack {
            Text("hig.materials.ios.vibrancy.title")
                .font(.title)

            ZStack {
                Image("watercolor")
                    .resizable()

                VStack {
                    VStack {
                        Text("hig.materials.ios.vibrancy.label.description")
                            .font(.body)
                        ForEach(labelVibrancies) { labelVibrancy in
                            HStack {
                                SampleImage(
                                    blurEffectStyle: .systemMaterial,
                                    vibrancyEffectStyle: labelVibrancy.vibrancyEffectStyle
                                )
                                    .frame(width: 50, height: 50)
                                Text(labelVibrancy.description)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            .background(.regularMaterial)
                        }
                    }.padding()

                    VStack {
                        Text("hig.materials.ios.vibrancy.separator.description")
                            .font(.body)
                        SampleDivider(blurEffectStyle: .systemMaterial)
                            .frame(height: 5)
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

// MARK: - LabelVibrancy

private struct LabelVibrancy: Identifiable {
    var id: UUID
    var vibrancyEffectStyle: UIVibrancyEffectStyle
    var description: LocalizedStringKey
}

// MARK: - Sample views

private struct SampleImage: UIViewRepresentable {
    private var blurEffectStyle: UIBlurEffect.Style
    private var vibrancyEffectStyle: UIVibrancyEffectStyle

    init(
        blurEffectStyle: UIBlurEffect.Style,
        vibrancyEffectStyle: UIVibrancyEffectStyle
    ) {
        self.blurEffectStyle = blurEffectStyle
        self.vibrancyEffectStyle = vibrancyEffectStyle
    }

    func makeUIView(context: Context) -> UIView {
        let imageView = UIImageView(image: UIImage(systemName: "square.and.arrow.up"))
        imageView.contentMode = .scaleAspectFit
        let visualEffectView = UIVisualEffectView(
            effect: UIVibrancyEffect(
                blurEffect: UIBlurEffect(style: blurEffectStyle),
                style: vibrancyEffectStyle
            )
        )
        visualEffectView.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: visualEffectView.contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: visualEffectView.contentView.heightAnchor),
            imageView.centerXAnchor.constraint(equalTo: visualEffectView.contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: visualEffectView.contentView.centerYAnchor),
        ])

        return visualEffectView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

private struct SampleDivider: UIViewRepresentable {
    private var blurEffectStyle: UIBlurEffect.Style

    init(
        blurEffectStyle: UIBlurEffect.Style
    ) {
        self.blurEffectStyle = blurEffectStyle
    }

    func makeUIView(context: Context) -> UIView {
        let separatorView = UIView()
        separatorView.backgroundColor = .separator
        let visualEffectView = UIVisualEffectView(
            effect: UIVibrancyEffect(
                blurEffect: UIBlurEffect(style: blurEffectStyle),
                style: .separator
            )
        )
        visualEffectView.contentView.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorView.widthAnchor.constraint(equalTo: visualEffectView.contentView.widthAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 5),
            separatorView.centerXAnchor.constraint(equalTo: visualEffectView.contentView.centerXAnchor),
            separatorView.centerYAnchor.constraint(equalTo: visualEffectView.contentView.centerYAnchor),
        ])

        return visualEffectView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

// MARK: - Xcode Preview

#Preview("VibrancyView(locale=enUS,colorScheme=light)") {
    VibrancyView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .light)
}

#Preview("VibrancyView(locale=enUS,colorScheme=dark)") {
    VibrancyView()
        .environment(\.colorScheme, .dark)
}

#Preview("VibrancyView(locale=jaJP,colorScheme=light)") {
    VibrancyView()
        .environment(\.locale, .jaJP)
        .environment(\.colorScheme, .light)
}

#Preview("SampleImage") {
    SampleImage(
        blurEffectStyle: .regular,
        vibrancyEffectStyle: .label
    )
}
