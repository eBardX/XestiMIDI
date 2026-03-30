// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import Foundation

public struct SMFParser {

    // MARK: Public Initializers

    public init() {
    }
}

// MARK: -

extension SMFParser {

    // MARK: Public Instance Methods

    public func parse(_ data: Data) throws -> SMFSequence {
        var reader = Reader(data: data)

        return try reader.readSequence()
    }
}
