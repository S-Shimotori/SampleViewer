import SwiftUI

struct ChartDescriptiveTextView: View {
    @State
    private var now = Date(timeIntervalSince1970: 1734834153) // 2024-12-22T11:22:33+09:00

    @State
    private var weatherForecasts = [
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734832800), // 2024-12-22T11:00:00+09:00
            event: .windy(temperature: 9)
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734836400), // 2024-12-22T12:00:00+09:00
            event: .windy(temperature: 10)
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734840000), // 2024-12-22T13:00:00+09:00
            event: .windy(temperature: 10)
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734843600), // 2024-12-22T14:00:00+09:00
            event: .windy(temperature: 9)
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734847200), // 2024-12-22T15:00:00+09:00
            event: .windy(temperature: 9)
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734850800), // 2024-12-22T16:00:00+09:00
            event: .windy(temperature: 8)
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734852660), // 2024-12-22T16:31:00+09:00
            event: .sunset
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734854400), // 2024-12-22T17:00:00+09:00
            event: .windy(temperature: 6)
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734858000), // 2024-12-22T18:00:00+09:00
            event: .clearNight(temperature: 5)
        ),
        WeatherForecast(
            id: UUID(),
            date: Date(timeIntervalSince1970: 1734861600), // 2024-12-22T19:00:00+09:00
            event: .clearNight(temperature: 4)
        ),
    ]

    var body: some View {
        VStack {
            Text("hig.charting-data.descriptive.title")
                .font(.title)
            Text("hig.charting-data.descriptive.description")
                .font(.body)
        }
        .padding()

        ZStack {
            Image("watercolor")
                .resizable()
            VStack {
                // TODO: Configure padding
                Text("hig.charting-data.descriptive.forecast.description")
                    .padding()
                Divider()
                    .padding(.leading)
                ScrollView(.horizontal) {
                    HStack(alignment: .center) {
                        ForEach(
                            Array(weatherForecasts.enumerated()),
                            id: \.offset
                        ) { index, weatherForecast in
                            VStack {
                                // TODO: Improve "Now" ("現在") logic
                                if index == 0, weatherForecast.date <= now {
                                    Text("hig.charting-data.descriptive.now.description")
                                }
                                else {
                                    eventDate(event: weatherForecast.event, date: weatherForecast.date)
                                }
                                eventImage(event: weatherForecast.event)
                                    .padding(.vertical, 2)
                                eventTitle(event: weatherForecast.event)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
                .scrollIndicators(.hidden)
            }
            .background(
                Material.ultraThin,
                in: RoundedRectangle(cornerRadius: 10)
            )
            .environment(\.colorScheme, .dark)
            .padding()
        }
    }

    private func eventDate(event: WeatherForecast.Event, date: Date) -> Text {
        switch event {
        case .sunny, .clearNight, .windy:
            Text(verbatim: date.formatted(.dateTime.hour()))
        case .sunrise, .sunset:
            Text(verbatim: date.formatted(.dateTime.hour().minute()))
        }
    }

    private func eventTitle(event: WeatherForecast.Event) -> Text {
        switch event {
        case let .sunny(temperature: temperature),
             let .clearNight(temperature: temperature),
             let .windy(temperature: temperature):
            // TODO: Use correct temperature unit
            Text(verbatim: "\(temperature)°")
        case .sunrise:
            Text("hig.charting-data.descriptive.sunrise.description")
        case .sunset:
            Text("hig.charting-data.descriptive.sunset.description")
        }
    }

    private func eventImage(event: WeatherForecast.Event) -> Image {
        let systemName =
            switch event {
            case .sunny:
                "sun.max.fill"
            case .clearNight:
                "moon.stars.fill"
            case .windy:
                "wind"
            case .sunrise:
                "sunrise.fill"
            case .sunset:
                "sunset.fill"
            }
        let renderingMode =
            switch event {
            case .sunny, .clearNight, .windy:
                SymbolRenderingMode.monochrome
            case .sunrise, .sunset:
                SymbolRenderingMode.multicolor
            }
        return Image(systemName: systemName)
            .symbolRenderingMode(renderingMode)
    }
}

struct WeatherForecast: Identifiable {
    var id: UUID
    var date: Date
    var event: Event

    enum Event {
        case sunny(temperature: Int)
        case clearNight(temperature: Int)

        case windy(temperature: Int)

        case sunrise
        case sunset
    }
}

// MARK: - Xcode Preview

#Preview("ChartDescriptiveTextView(locale=enUS,colorScheme=light)") {
    ChartDescriptiveTextView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .light)
}

#Preview("ChartDescriptiveTextView(locale=enUS,colorScheme=dark)") {
    ChartDescriptiveTextView()
        .environment(\.locale, .enUS)
        .environment(\.colorScheme, .dark)
}

#Preview("ChartDescriptiveTextView(locale=jaJP,colorScheme=light)") {
    ChartDescriptiveTextView()
        .environment(\.locale, .jaJP)
        .environment(\.colorScheme, .light)
}
