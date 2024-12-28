import Foundation

/// Midnight of today.
/// - Returns: A new `Date`, or `nil` if fails to calculate.
public func midnightOfToday(
    _ date: Date,
    calendarIdentifier: Calendar.Identifier,
    timeZone: TimeZone,
    locale: Locale
) -> Date? {
    var calendar = Calendar(identifier: calendarIdentifier)
    calendar.timeZone = timeZone
    calendar.locale = locale

    return calendar.date(from: calendar.dateComponents([.year, .month, .day], from: date))
}

/// Midnight of the next day.
/// - Returns: A new `Date`, or `nil` if fails to calculate.
public func midnightOfNextDay(
    _ date: Date,
    calendarIdentifier: Calendar.Identifier,
    timeZone: TimeZone,
    locale: Locale
) -> Date? {
    var calendar = Calendar(identifier: calendarIdentifier)
    calendar.timeZone = timeZone
    calendar.locale = locale

    guard let midnightDate = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: date)) else {
        return nil
    }

    return calendar.date(byAdding: .day, value: 1, to: midnightDate)
}
