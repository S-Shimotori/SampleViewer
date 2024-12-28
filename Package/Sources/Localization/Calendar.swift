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

    /// Midnight of the first day of this week.
    /// - Returns: A new `Date`, or `nil` if fails to calculate.
    public func midnightOfFirstDayOfThisWeek(
        from date: Date
    ) -> Date? {
        var candidateDate = self.midnightOfToday(from: date)

        while true {
            guard let midnight = candidateDate else {
                return nil
            }

            if self.component(.weekday, from: midnight) == self.firstWeekday {
                break
            }

            candidateDate = self.date(byAdding: .day, value: -1, to: midnight)
        }

        return candidateDate
    }

    /// Midnight of the first day of next week.
    /// - Returns: A new `Date`, or `nil` if fails to calculate.
    public func midnightOfFirstDayOfNextWeek(
        from date: Date
    ) -> Date? {
        var candidateDate = self.midnightOfNextDay(from: date)

        while true {
            guard let midnight = candidateDate else {
                return nil
            }

            if self.component(.weekday, from: midnight) == self.firstWeekday {
                break
            }

            candidateDate = self.date(byAdding: .day, value: 1, to: midnight)
        }

        return candidateDate
    }
}
