import Alert
import UIKit

public protocol AlertBuilder {
    func build(_ alert: Alert, or debugErrorMessage: String?) -> UIViewController
}

extension AlertBuilder {
    public func build(
        _ alert: Alert,
        or debugError: Error?
    ) -> UIViewController {
        build(
            alert,
            or: debugError?.localizedDescription
        )
    }

    public func build(_ alert: Alert) -> UIViewController {
        build(
            alert,
            or: nil
        )
    }
}
