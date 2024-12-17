import Foundation

/// Stringify the given positive integer value.
/// - Parameters:
///   - value: A positive number.
///   - locale: What locale the given value will be converted to.
/// - Returns: A string, or `nil` when the given value is not positive.
public func localizedPositiveNumber(_ value: Int, locale: Locale) -> String? {
    guard value > 0 else { return nil }

    let numberFormatter = NumberFormatter()
    numberFormatter.locale = locale

    var digits = value
    var result = ""
    var cache = [Int: String]()

    while digits > 0 {
        defer {
            digits /= 10
        }
        let digit = digits % 10

        if let string = cache[digit] {
            result = string + result
        }
        else {
            let string = numberFormatter.string(from: NSNumber(value: digit)) ?? ""
            cache[digit] = string
            result = string + result
        }
    }

    return result
}
