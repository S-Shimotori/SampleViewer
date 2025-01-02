import SwiftUI

struct OfferChoiceView: View {
    @State
    private var selectedFlavor: Flavor = .chocolate

    var body: some View {
        VStack {
            Text("hig.entering-data.choices.title")
                .font(.title)
            Text("hig.entering-data.choices.description")
                .font(.body)
        }
        .padding()


        List {
            Picker("hig.entering-data.choices.picker.label", selection: $selectedFlavor) {
                Text("hig.entering-data.choices.picker.chocolate.description")
                    .tag(Flavor.chocolate)
                Text("hig.entering-data.choices.picker.vanilla.description")
                    .tag(Flavor.vanilla)
                Text("hig.entering-data.choices.picker.strawberry.description")
                    .tag(Flavor.strawberry)
            }
        }
    }
}

// MARK: - Flavor

private enum Flavor: String, CaseIterable {
    case chocolate
    case vanilla
    case strawberry
}

extension Flavor: Identifiable {
    var id: Self { self }
}

// MARK: - Xcode Preview

#Preview("OfferChoiceView(locale=enUS)") {
    OfferChoiceView()
        .environment(\.locale, .enUS)
}

#Preview("OfferChoiceView(locale=jaJP)") {
    OfferChoiceView()
        .environment(\.locale, .jaJP)
}
