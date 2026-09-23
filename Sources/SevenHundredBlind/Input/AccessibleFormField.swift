import SwiftUI

public struct AccessibleFormField: View {
    private let title: String
    @Binding private var text: String
    private let hint: String?

    public init(_ title: String, text: Binding<String>, hint: String? = nil) {
        self.title = title
        self._text = text
        self.hint = hint
    }

    public var body: some View {
        TextField(title, text: $text)
            .textFieldStyle(.roundedBorder)
            .accessibilityLabel(title)
            .accessibilityHint(hint ?? "")
    }
}
