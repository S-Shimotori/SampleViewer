import Foundation

extension Calendar {
    /// Midnight of today.
    /// - Returns: A new `Date`, or `nil` if fails to calculate.
    public func midnightOfToday(
        from date: Date
    ) -> Date? {
        return self.date(from: dateComponents([.year, .month, .day], from: date))
    }

    /// Midnight of the next day.
    /// - Returns: A new `Date`, or `nil` if fails to calculate.
    public func midnightOfNextDay(
        from date: Date
    ) -> Date? {
        guard let midnightDate = self.date(from: dateComponents([.year, .month, .day], from: date)) else {
            return nil
        }

        return self.date(byAdding: .day, value: 1, to: midnightDate)
    }
}
