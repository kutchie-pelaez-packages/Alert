import UIKit

public protocol AlertBuilderProvider: AnyObject {
    var tintColor: UIColor { get }
    func lozalizedTitle(for key: AlertLocalizationKey) -> String
}
