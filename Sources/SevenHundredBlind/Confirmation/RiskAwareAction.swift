import SwiftUI

public enum ActionRisk: Sendable {
    case low
    case medium
    case high
}

public struct RiskAwareAction<Label: View>: View {
    private let risk: ActionRisk
    private let action: () -> Void
    private let label: () -> Label
    @State private var showConfirmation = false

    public init(risk: ActionRisk, action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.risk = risk
        self.action = action
        self.label = label
    }

    public var body: some View {
        Button {
            switch risk {
            case .low: action()
            case .medium, .high: showConfirmation = true
            }
        } label: {
            label()
        }
        .confirmationDialog(
            risk == .high ? "Confirm high-risk action" : "Confirm action",
            isPresented: $showConfirmation
        ) {
            Button("Confirm", role: risk == .high ? .destructive : nil, action: action)
            Button("Cancel", role: .cancel) { }
        }
    }
}
