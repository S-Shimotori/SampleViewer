import SwiftUI

struct RTLVisuallyBalanceView: View {
    var body: some View {
        VStack {
            Text("hig.right-to-left.font-size.title")
                .font(.title)
            Text("hig.right-to-left.font-size.description")
                .font(.body)
        }
        .padding()

        GroupBox {
            HStack {
                Button {
                } label: {
                    Text(verbatim: "Download")
                        .font(.system(size: 20))
                }
                .buttonStyle(.borderedProminent)
                Button {
                } label: {
                    Text(verbatim: "تنزيل")
                        .font(.system(size: 20))
                }
                .buttonStyle(.borderedProminent)
                Button {
                } label: {
                    Text(verbatim: "הורד")
                        .font(.system(size: 20))
                }
                .buttonStyle(.borderedProminent)
            }
        } label: {
            Text(verbatim: "(20pt, 20pt, 20pt)")
        }
        .padding()

        GroupBox {
            HStack {
                Button {
                } label: {
                    Text(verbatim: "Download")
                        .font(.system(size: 20))
                }
                .buttonStyle(.borderedProminent)
                Button {
                } label: {
                    Text(verbatim: "تنزيل")
                        .font(.system(size: 22))
                }
                .buttonStyle(.borderedProminent)
                Button {
                } label: {
                    Text(verbatim: "הורד")
                        .font(.system(size: 22))
                }
                .buttonStyle(.borderedProminent)
            }
        } label: {
            Text(verbatim: "(20pt, 22pt, 22pt)")
        }
        .padding()
    }
}

// MARK: - Xcode Preview

#Preview("RTLVisuallyBalanceView(locale=enUS)") {
    RTLVisuallyBalanceView()
        .environment(\.locale, .enUS)
}

#Preview("RTLVisuallyBalanceView(locale=jaJP)") {
    RTLVisuallyBalanceView()
        .environment(\.locale, .jaJP)
}
