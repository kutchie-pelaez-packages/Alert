import Core
import UIKit

public struct AlertBuilderFactory {
    public init() { }

    public func produce(
        environment: Environment,
        provider: AlertBuilderProvider
    ) -> AlertBuilder {
        AlertBuilderImpl(
            environment: environment,
            provider: provider
        )
    }
}
