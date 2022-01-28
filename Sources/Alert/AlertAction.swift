import Core

public struct AlertAction {
    public enum Title {
        case cancel
        case close
        case done
        case delete
        case custom(String)
    }

    public enum Style {
        case `default`
        case cancel
        case destructive
    }

    public init(
        _ title: String,
        style: Style = .default,
        block: @escaping Block
    ) {
        self.title = .custom(title)
        self.style = style
        self.block = block
    }

    public let title: Title
    public let style: Style
    public let block: Block?
}
