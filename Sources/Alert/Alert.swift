public struct Alert {
    public enum Style {
        case alert
        case actionSheet
    }

    public init(
        title: String? = nil,
        message: String? = nil,
        style: Style = .alert,
        actions: [AlertAction] = []
    ) {
        self.title = title
        self.message = message
        self.style = style
        self.actions = actions
    }

    public init(
        title: String? = nil,
        message: String? = nil,
        style: Style = .alert,
        actions: AlertAction...
    ) {
        self.init(
            title: title,
            message: message,
            style: style,
            actions: actions
        )
    }

    public let title: String?
    public let message: String?
    public let style: Style
    public let actions: [AlertAction]
}
