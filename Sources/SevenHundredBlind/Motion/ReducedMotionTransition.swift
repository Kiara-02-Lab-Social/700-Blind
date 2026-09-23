import SwiftUI

public struct ReducedMotionTransition<Content: View>: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    private let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        content()
            .animation(reduceMotion ? nil : .snappy, value: reduceMotion)
    }
}
