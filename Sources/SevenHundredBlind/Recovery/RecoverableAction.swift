import SwiftUI

public struct RecoverableAction<Label: View>: View {
    private let action: () async throws -> Void
    private let label: () -> Label
    @State private var errorMessage: String?
    @State private var isRunning = false

    public init(action: @escaping () async throws -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                Task { await run() }
            } label: {
                label()
            }
            .disabled(isRunning)

            if let errorMessage {
                Text(errorMessage)
                    .accessibilityLabel("Action failed. \(errorMessage). Try again.")
                Button("Try again") {
                    Task { await run() }
                }
            }
        }
    }

    @MainActor
    private func run() async {
        isRunning = true
        errorMessage = nil
        defer { isRunning = false }
        do { try await action() }
        catch { errorMessage = error.localizedDescription }
    }
}
