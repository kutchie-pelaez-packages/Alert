import Core
import UIKit

public struct AlertBuilderFactory {
    public init() { }

    public func produce(
        environment: Environment,
        tintColor: UIColor? = nil,
        provider: AlertBuilderProvider
    ) -> AlertBuilder {
        AlertBuilderImpl(
            environment: environment,
            tintColor: tintColor,
            provider: provider
        )
    }
}
