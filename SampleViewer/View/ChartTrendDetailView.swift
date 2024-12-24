import SwiftUI
import Charts

struct ChartTrendDetailView: View {
    @Environment(\.locale) private var locale: Locale
    @Environment(\.timeZone) private var timeZone: TimeZone

    // TODO: Generate daily step log
    @State
    private var steps: [Step] = [
        2585,
        2161,
        1427,
        3085,
        1323,
        2036,
        2290,
        3750,
        3667,
        1132,
        4630,
        1692,
        1187,
        1214,
        4269,
        4033,
        4909,
        4915,
        2480,
        1321,
        3333,
        1029,
        3163,
        2821,
        1666,
    ]
    .enumerated()
    .map { index, numberOfSteps in
        Step(
            id: UUID(),
            date: Date(
                timeIntervalSince1970: 1704207600 // 2024-01-03T00:00:00+09:00
                + TimeInterval(60 * 60 * 24 * 7 * index) // 1 week
            ),
            numberOfSteps: numberOfSteps
        )
    }

    // TODO: Support other stride types
    @State
    private var scale = Scale.halfYearly

    var body: some View {
        // TODO: Calculate daily average, not weekly average
        let averageOfSteps =
            steps.isEmpty ? 0 : steps.reduce(0) { $0 + $1.numberOfSteps } / steps.count

        NavigationStack {
            VStack {
                Picker("hig.charting-data.trend-detail.chart.scale.description", selection: $scale) {
                    ForEach(Scale.allCases) {
                        Text($0.localizedString)
                            // FIXME: Enable accessibility label
                            .accessibilityLabel(Text($0.accessibilityLocalizedString))
                    }
                }
                .pickerStyle(.segmented)

                // FIXME: Accessibility area
                VStack(alignment: .leading) {
                    Text("hig.charting-data.trend-detail.chart.title")
                        .foregroundStyle(Color.gray)
                        .font(.subheadline)
                    Text(averageOfSteps.formatted())
                        .font(.system(.largeTitle))
                    +
                    Text("unit.steps")
                        .foregroundStyle(Color.gray)
                    domainText()
                        .foregroundStyle(Color.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                // FIXME: Remove "てん" from text in ja_JP
                .accessibilityElement(children: .combine)

                Chart {
                    ForEach(steps) { step in
                        BarMark(
                            x: .value("hig.charting-data.trend.chart.week.description", step.date),
                            y: .value("hig.charting-data.trend.chart.step.description", step.numberOfSteps)
                        )
                        .foregroundStyle(Color.gray)
                        .accessibilityLabel(
                            "hig.charting-data.trend.chart.bar.accessibility.label\(step.date.formatted(localizedDateFormatStyle().month().day()))"
                        )
                        .accessibilityValue(
                            "hig.charting-data.trend.chart.bar.accessibility.value\(averageOfSteps)"
                        )
                    }

                    // TODO: Hides this rule mark after tapping a picker button
                    if let minimumOfDate = steps.map({ $0.date }).min(),
                       let maximumOfDate = steps.map({ $0.date }).max() {
                        RuleMark(
                            xStart: .value("hig.charting-data.trend.chart.week.description", minimumOfDate),
                            xEnd: .value("hig.charting-data.trend.chart.week.description", maximumOfDate),
                            y: .value("hig.charting-data.trend.chart.step.description", averageOfSteps)
                        )
                        .foregroundStyle(Color.red)
                        .lineStyle(StrokeStyle(lineWidth: 5, lineCap: .round))
                        .annotation(position: .top, alignment: .trailing) {
                            Text("unit.steps\(averageOfSteps)")
                                .foregroundStyle(Color.red)
                        }
                    }
                }
                .chartXAxis {
                    // TODO: Configure stride for each scale
                    AxisMarks(values: .stride(by: .month, count: 1)) { value in
                        if let date = value.as(Date.self) {
                            // TODO: Show labels correctly
                            AxisValueLabel {
                                switch scale {
                                case .daily:
                                    Text(date, format: localizedDateFormatStyle().hour())
                                case .weekly:
                                    Text(date, format: localizedDateFormatStyle().week())
                                case .monthly:
                                    Text(date, format: localizedDateFormatStyle().day())
                                case .halfYearly, .yearly:
                                    Text(date, format: localizedDateFormatStyle().month(.abbreviated))
                                }
                            }

                            AxisGridLine()
                            AxisTick()
                        }
                    }
                }
                .chartYAxis {
                    AxisMarks(values: .automatic(desiredCount: numberOfYAxisMarks()))
                }
                .frame(height: 300)
            }
            .navigationTitle("hig.charting-data.trend-detail.navigation.title")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }

    private func numberOfYAxisMarks() -> Int {
        switch scale {
        case .daily, .weekly, .monthly: 4
        case .halfYearly, .yearly: 3
        }
    }

    private func domainText() -> Text? {
        let dates = steps.sorted { $0.date < $1.date }.map(\.date)
        guard let startDate = dates.first, let endDate = dates.last else {
            return nil
        }

        let yearFormatStyle = localizedDateFormatStyle().year()
        let isAcrossYears = startDate.formatted(yearFormatStyle) != endDate.formatted(yearFormatStyle)

        let hasYearPrefix =
            switch locale {
            case .jaJP:
                true
            case .enUS:
                false
            default:
                false
            }
        let hasYearSuffix = !hasYearPrefix

        let formatStyle = localizedDateFormatStyle().month().day()
        let startFormatStyle = isAcrossYears || hasYearPrefix ? formatStyle.year() : formatStyle
        let endFormatStyle = isAcrossYears || hasYearSuffix ? formatStyle.year() : formatStyle
        return Text("hig.charting-data.trend-detail.domain.description\(startDate.formatted(startFormatStyle))\(endDate.formatted(endFormatStyle))")
    }

    private func localizedDateFormatStyle() -> Date.FormatStyle {
        var formatStyle = Date.FormatStyle.dateTime.locale(locale)
        formatStyle.timeZone = timeZone
        return formatStyle
    }
}

private enum Scale: CaseIterable {
    case daily
    case weekly
    case monthly
    case halfYearly
    case yearly

    var localizedString: LocalizedStringKey {
        switch self {
        case .daily: "hig.charting-data.trend-detail.segmented.daily.description"
        case .weekly: "hig.charting-data.trend-detail.segmented.weekly.description"
        case .monthly: "hig.charting-data.trend-detail.segmented.monthly.description"
        case .halfYearly: "hig.charting-data.trend-detail.segmented.half-yearly.description"
        case .yearly: "hig.charting-data.trend-detail.segmented.yearly.description"
        }
    }

    var accessibilityLocalizedString: LocalizedStringKey {
        switch self {
        case .daily: "hig.charting-data.trend-detail.segmented.daily.accessibility.label"
        case .weekly: "hig.charting-data.trend-detail.segmented.weekly.accessibility.label"
        case .monthly: "hig.charting-data.trend-detail.segmented.monthly.accessibility.label"
        case .halfYearly: "hig.charting-data.trend-detail.segmented.half-yearly.accessibility.label"
        case .yearly: "hig.charting-data.trend-detail.segmented.yearly.accessibility.label"
        }
    }
}

extension Scale: Identifiable {
    var id: Self { self }
}

private struct Step: Identifiable {
    var id: UUID
    var date: Date
    var numberOfSteps: Int
}

// MARK: - Xcode Preview

#Preview("ChartTrendDetailView(locale=enUS,timeZone=losAngeles)") {
    ChartTrendDetailView()
        .environment(\.timeZone, .losAngeles)
        .environment(\.locale, .enUS)
}

#Preview("ChartTrendDetailView(locale=jaJP,timeZone=tokyo)") {
    ChartTrendDetailView()
        .environment(\.timeZone, .tokyo)
        .environment(\.locale, .jaJP)
}
