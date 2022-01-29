import Alert
import Core
import UIKit

final class AlertBuilderImpl: AlertBuilder {
    init(
        environment: Environment,
        provider: AlertBuilderProvider
    ) {
        self.environment = environment
        self.provider = provider
    }

    private let environment: Environment
    private unowned let provider: AlertBuilderProvider

    // MARK: -

    private func alertTitle(from alert: Alert) -> String? {
        if
            alert.title == nil &&
            alert.message == nil
        {
            return safeUndefined(
                " ",
                "Failed to construct alert with both empty title & message"
            )
        } else {
            return alert.title
        }
    }

    private func alertPreferredStyle(from alert: Alert) -> UIAlertController.Style {
        switch alert.style {
        case .alert:
            return .alert

        case .actionSheet:
            return .actionSheet
        }
    }

    private func alertActionTitle(from title: AlertAction.Title) -> String {
        switch title {
        case .cancel:
            return provider.lozalizedTitle(for: .cancel)

        case .close:
            return provider.lozalizedTitle(for: .close)

        case .done:
            return provider.lozalizedTitle(for: .done)

        case .delete:
            return provider.lozalizedTitle(for: .delete)

        case let .custom(string):
            return string
        }
    }

    private func alertActionStyle(from style: AlertAction.Style) -> UIAlertAction.Style {
        switch style {
        case .default:
            return .default

        case .cancel:
            return .cancel

        case .destructive:
            return .destructive
        }
    }

    // MARK: - AlertBuilder

    func build(_ alert: Alert, or debugErrorMessage: String?) -> UIViewController {
        let alertToBuild: Alert
        switch environment {
        case .dev:
            if let debugErrorMessage = debugErrorMessage {
                alertToBuild = Alert(
                    title: "DEBUG ERROR",
                    message: debugErrorMessage,
                    style: alert.style,
                    actions: alert.actions
                )
            } else {
                alertToBuild = alert
            }

        case .prod:
            alertToBuild = alert
        }

        let alertController = UIAlertController(
            title: alertTitle(from: alertToBuild),
            message: alertToBuild.message,
            preferredStyle: alertPreferredStyle(from: alertToBuild)
        )

        if let tintColor = provider.tintColor {
            alertController.view.tintColor = tintColor
        }

        for action in alertToBuild.actions {
            let alertAction = UIAlertAction(
                title: alertActionTitle(from: action.title),
                style: alertActionStyle(from: action.style),
                handler: { _ in
                    action.block?()
                }
            )
            alertController.addAction(alertAction)
        }

        return alertController
    }
}
