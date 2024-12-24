import SwiftUI
import Charts

struct ChartTrendView: View {
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

    var body: some View {
        // TODO: Calculate daily average, not weekly average
        let averageOfSteps =
            steps.isEmpty ? 0 : steps.reduce(0) { $0 + $1.numberOfSteps } / steps.count

        // TODO: Set background color to entire view
        NavigationStack {
            VStack {
                Text("hig.charting-data.trend.title")
                    .font(.title)
                Text("hig.charting-data.trend.description")
                    .font(.body)
            }
            .padding()

            VStack {
                // FIXME: Highlight only background when a user taps
                NavigationLink(destination: ChartTrendDetailView()) {
                    VStack {
                        HStack {
                            Image(systemName: "flame.fill")
                                .foregroundStyle(Color.red)
                            Text("hig.charting-data.trend.chart.title")
                                .foregroundStyle(Color.red)
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundStyle(Color.gray)
                        }
                        .padding(.bottom)
                        Text("hig.charting-data.trend.summary.description\(steps.count)\(averageOfSteps)")
                        Divider()
                        Chart {
                            ForEach(steps) { step in
                                BarMark(
                                    x: .value("hig.charting-data.trend.chart.week.description", step.date),
                                    y: .value("hig.charting-data.trend.chart.step.description", step.numberOfSteps)
                                )
                                .foregroundStyle(Color.gray)
                            }

                            if let minimumOfDate = steps.map({ $0.date }).min(),
                               let maximumOfDate = steps.map({ $0.date }).max() {
                                RuleMark(
                                    xStart: .value("hig.charting-data.trend.chart.week.description", minimumOfDate),
                                    xEnd: .value("hig.charting-data.trend.chart.week.description", maximumOfDate),
                                    y: .value("hig.charting-data.trend.chart.step.description", averageOfSteps)
                                )
                                .foregroundStyle(Color.red)
                                .lineStyle(StrokeStyle(lineWidth: 5, lineCap: .round))
                                .annotation(position: .top, alignment: .leading) {
                                    Text("unit.steps\(averageOfSteps)")
                                        .foregroundStyle(Color.red)
                                }
                            }
                        }
                        .chartXAxis(.hidden)
                        .chartYAxis(.hidden)
                        .frame(height: 150)
                        .accessibilityLabel("hig.charting-data.trend.chart.accessibility.value")
                        Text("unit.weeks\(steps.count)")
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .accessibilityHidden(true)
                    }
                }
                .buttonStyle(.plain)
                // FIXME: Remove "てん" from text in ja_JP
                .accessibilityElement(children: .combine)
                .padding()
                .background(Color("hig.charting-data.trend.box.background"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .navigationTitle("hig.charting-data.trend.navigation.title")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct Step: Identifiable {
    var id: UUID
    var date: Date
    var numberOfSteps: Int
}

// MARK: - Xcode Preview

#Preview("ChartTrendView(locale=enUS,colorScheme=light)") {
    ChartTrendView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .light)
}

#Preview("ChartTrendView(locale=enUS,colorScheme=dark)") {
    ChartTrendView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .dark)
}

#Preview("ChartTrendView(locale=jaJP,colorScheme=light)") {
    ChartTrendView()
        .environment(\.locale, .jaJP)
        .environment(\.colorScheme, .light)
}
