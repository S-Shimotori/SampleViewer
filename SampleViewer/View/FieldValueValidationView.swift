import SwiftUI

struct FieldValueValidationView: View {
    @State
    private var price = 0.0

    var body: some View {
        VStack {
            Text("hig.entering-data.validation.title")
                .font(.title)
            Text("hig.entering-data.validation.description")
                .font(.body)
        }
        .padding()

        Form {
            Section {
                TextField(
                    "hig.entering-data.validation.price.label",
                    value: $price,
                    format: .number.precision(.fractionLength(2))
                )
                .keyboardType(.decimalPad)
            } footer: {
                Text(price, format: .currency(code: "JPY").precision(.fractionLength(2)))
            }
        }
    }
}

// MARK: - Xcode Preview

#Preview("FieldValueValidationView(locale=enUS)") {
    FieldValueValidationView()
        .environment(\.locale, .enUS)
}

#Preview("FieldValueValidationView(locale=jaJP)") {
    FieldValueValidationView()
        .environment(\.locale, .jaJP)
}
