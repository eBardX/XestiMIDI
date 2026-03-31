// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import Foundation

public struct SMFFormatter {

    // MARK: Public Initializers

    public init() {
    }
}

// MARK: -

extension SMFFormatter {

    // MARK: Public Instance Methods

    public func format(_ sequence: SMFSequence) throws -> Data {
        var writer = Writer(sequence: sequence)

        return try writer.writeSequence()
    }
}

// MARK: - Sendable

extension SMFFormatter: Sendable {
}
