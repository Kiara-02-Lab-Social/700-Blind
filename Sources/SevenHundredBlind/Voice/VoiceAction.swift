import SwiftUI

public struct VoiceAction<Label: View>: View {
    private let action: () -> Void
    private let accessibilityLabelText: String
    private let label: () -> Label

    public init(
        accessibilityLabel: String,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.accessibilityLabelText = accessibilityLabel
        self.action = action
        self.label = label
    }

    public var body: some View {
        Button(action: action, label: label)
            .accessibilityLabel(accessibilityLabelText)
            .accessibilityAddTraits(.isButton)
    }
}
