import Foundation

public enum BoundaryOwner: String, Sendable, CaseIterable {
    case human = "Human"
    case agent = "Agent"
    case shared = "Shared"
}

public struct BoundaryContract: Sendable, Equatable {
    public var observe: BoundaryOwner
    public var understand: BoundaryOwner
    public var decide: BoundaryOwner
    public var act: BoundaryOwner
    public var verify: BoundaryOwner

    public init(
        observe: BoundaryOwner,
        understand: BoundaryOwner,
        decide: BoundaryOwner,
        act: BoundaryOwner,
        verify: BoundaryOwner
    ) {
        self.observe = observe
        self.understand = understand
        self.decide = decide
        self.act = act
        self.verify = verify
    }
}
