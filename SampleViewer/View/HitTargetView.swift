import SwiftUI
import HIGConstants
import Localization

struct HitTargetView: View {
    private let dateProvider: any DateProviderProtocol

    @Environment(\.timeZone)
    private var timeZone: TimeZone

    @Environment(\.locale)
    private var locale: Locale

    @State
    private var timestamp: Date?

    init(dateProvider: some DateProviderProtocol) {
        self.dateProvider = dateProvider
    }

    var body: some View {
        VStack {
            Text("hig.accessibility.controls.size.title")
                .font(.title)
            Text("hig.accessibility.controls.size.description")
                .font(.body)

            Button {
                timestamp = dateProvider.now
            } label: {
                Image(systemName: "hand.thumbsup.fill")
            }
            .frame(
                width: HitTarget.minimumWidth,
                height: HitTarget.minimumHeight
            )
            .foregroundStyle(.white)
            .background(.blue)

            (
                Text("hig.accessibility.controls.size.button.caption")
                + Text(verbatim: " : ")
                + Text(verbatim: timestamp.map { formatted($0) } ?? "---")
            )
            .font(.caption)
        }
    }

    private func formatted(_ date: Date) -> String {
        var formatStyle = Date.FormatStyle.dateTime
            .year()
            .month()
            .day()
            .hour()
            .minute()
            .second()
            .locale(locale)
        formatStyle.timeZone = timeZone
        return date.formatted(formatStyle)
    }
}

// MARK: - Xcode Preview

#Preview {
    HitTargetView(
        dateProvider: StubDateProvider()
    )
    .environment(\.timeZone, .losAngeles)
    .environment(\.locale, .enUS)
}

#Preview {
    HitTargetView(
        dateProvider: StubDateProvider()
    )
    .environment(\.timeZone, .tokyo)
    .environment(\.locale, .jaJP)
}

private struct StubDateProvider: DateProviderProtocol {
    // 2014-10-15T09:30:45+09:00
    let now = Date(timeIntervalSince1970: 1728952245)
}
