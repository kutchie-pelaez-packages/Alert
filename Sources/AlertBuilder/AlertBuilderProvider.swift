import CoreUI
import UIKit

public protocol AlertBuilderProvider {
    var tintColor: UIColor { get }
    func lozalizedTitle(for key: AlertLocalizationKey) -> String
}

extension AlertBuilderProvider {
    public var tintColor: UIColor {
        SystemColors.Tint.primary
    }
}
