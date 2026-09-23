import Testing
@testable import SevenHundredBlind

@Test func boundaryContractStoresOwners() {
    let contract = BoundaryContract(
        observe: .agent,
        understand: .agent,
        decide: .human,
        act: .agent,
        verify: .shared
    )
    #expect(contract.decide == .human)
    #expect(contract.verify == .shared)
}
