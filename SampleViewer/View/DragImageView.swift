import SwiftUI

struct DragImageView: View {
    private var imageName = "owata"

    var body: some View {
        VStack {
            Text("hig.drag-and-drop.image.title")
                .font(.title)
            Text("hig.drag-and-drop.image.description")
                .font(.body)
        }
        .padding()

        VStack {
            if let imageData = UIImage(named: imageName)?.pngData() {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .draggable(DraggableImage(pngImage: imageData))
            }
            else {
                Text(verbatim: "No Image")
            }
        }
        .padding()
    }
}

private struct DraggableImage {
    private var pngImage: Data

    init(pngImage: Data) {
        self.pngImage = pngImage
    }
}

extension DraggableImage: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(importedContentType: .png) { receivedTransferrable in
            DraggableImage(pngImage: receivedTransferrable)
        }
    }
}

// MARK: - Xcode Preview

#Preview("DragImageView(locale=enUS)") {
    DragImageView()
        .environment(\.locale, .enUS)
}

#Preview("DragImageView(locale=jaJP)") {
    DragImageView()
        .environment(\.locale, .jaJP)
}
