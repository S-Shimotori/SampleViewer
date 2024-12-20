import SwiftUI

struct FontWeightView: View {
    var body: some View {
        VStack {
            Text("hig.typography.font-weight.title")
                .font(.title)
            Text("hig.typography.font-weight.description")
                .font(.body)
        }
        .padding()

        VStack {
            Text("font-weight.ultralight")
                .fontWeight(.ultraLight)
            Text("font-weight.thin")
                .fontWeight(.thin)
            Text("font-weight.light")
                .fontWeight(.light)
            Text("font-weight.regular")
                .fontWeight(.regular)
            Text("font-weight.medium")
                .fontWeight(.medium)
            Text("font-weight.semibold")
                .fontWeight(.semibold)
            Text("font-weight.bold")
                .fontWeight(.bold)
            Text("font-weight.heavy")
                .fontWeight(.heavy)
            Text("font-weight.black")
                .fontWeight(.black)
        }
        .padding()
    }
}

// MARK: - Xcode Preview

#Preview("FontWeightView(locale=enUS)") {
    FontWeightView()
        .environment(\.locale, .enUS)
}

#Preview("FontWeightView(locale=jaJP)") {
    FontWeightView()
        .environment(\.locale, .jaJP)
}
