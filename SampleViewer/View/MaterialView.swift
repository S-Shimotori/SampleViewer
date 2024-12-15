import SwiftUI

struct MaterialView: View {
    private let materialItems = [
        MaterialItem(id: UUID(), material: .ultraThin, title: "ultraThin"),
        MaterialItem(id: UUID(), material: .thin, title: "thin"),
        MaterialItem(id: UUID(), material: .regular, title: "regular"),
        MaterialItem(id: UUID(), material: .thick, title: "thick"),
        MaterialItem(id: UUID(), material: .ultraThick, title: "ultraThick"),
    ]

    var body: some View {
        VStack {
            VStack {
                Text("hig.materials.ios.title")
                    .font(.title)
                Text("hig.materials.ios.description")
                    .font(.body)
            }

            ZStack {
                Image("watercolor")
                    .resizable()
                VStack {
                    ForEach(materialItems) { materialItem in
                        MaterialRectangle(
                            title: materialItem.title,
                            material: materialItem.material
                        )
                    }
                }.padding()
            }
        }.padding()
    }
}

// MARK: - MaterialItem

private struct MaterialItem: Identifiable {
    var id: UUID
    var material: Material
    var title: String
}

// MARK: - MaterialRectangle

private struct MaterialRectangle: View {
    private var cornerRadius = CGFloat(20)
    private var title: String
    private var material: Material

    init(title: String, material: Material) {
        self.title = title
        self.material = material
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
            VStack {
                Text(verbatim: title)
                    .fontDesign(.monospaced)
            }
        }
        .background(
            material,
            in: RoundedRectangle(cornerRadius: cornerRadius)
        )
    }
}

// MARK: - Xcode Preview

#Preview("MaterialView(colorScheme=light)") {
    MaterialView()
        .environment(\.colorScheme, .light)
}

#Preview("MaterialView(colorScheme=dark)") {
    MaterialView()
        .environment(\.colorScheme, .dark)
}
