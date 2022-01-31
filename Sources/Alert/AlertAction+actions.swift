import Core

extension AlertAction {
    private init(
        title: Title,
        style: Style,
        block: Block?
    ) {
        self.style = style
        self.title = title
        self.block = block
    }

    public static var cancel: AlertAction { cancel(nil) }
    public static func cancel(_ block: Block?) -> AlertAction {
        AlertAction(
            title: .cancel,
            style: .cancel,
            block: block
        )
    }

    public static var edit: AlertAction { edit(nil) }
    public static func edit(_ block: Block?) -> AlertAction {
        AlertAction(
            title: .edit,
            style: .default,
            block: block
        )
    }

    public static var close: AlertAction { close(nil) }
    public static func close(_ block: Block?) -> AlertAction {
        AlertAction(
            title: .close,
            style: .default,
            block: block
        )
    }

    public static var done: AlertAction { done(nil) }
    public static func done(_ block: Block?) -> AlertAction {
        AlertAction(
            title: .done,
            style: .default,
            block: block
        )
    }

    public static var delete: AlertAction { delete(nil) }
    public static func delete(_ block: Block?) -> AlertAction {
        AlertAction(
            title: .delete,
            style: .destructive,
            block: block
        )
    }
}
