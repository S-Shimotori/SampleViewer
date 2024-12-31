import SwiftUI
import UIKit

struct UserInterfaceLevel {
}

extension UserInterfaceLevel: EnvironmentKey {
    static var defaultValue: UIUserInterfaceLevel {
        return UITraitCollection.current.userInterfaceLevel
    }
}

extension EnvironmentValues {
    var userInterfaceLevel: UIUserInterfaceLevel {
        get {
            self[UserInterfaceLevel.self]
        }
        set {
            self[UserInterfaceLevel.self] = newValue
        }
    }
}
