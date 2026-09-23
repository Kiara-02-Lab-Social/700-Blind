import SwiftUI

public struct AccessibleStatus: View {
    private let message: String

    public init(_ message: String) {
        self.message = message
    }

    public var body: some View {
        Text(message)
            .accessibilityLabel(message)
            .accessibilityAddTraits(.updatesFrequently)
    }
}
