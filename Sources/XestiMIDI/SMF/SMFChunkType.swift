// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

public struct SMFChunkType: StringRepresentable {

    // MARK: Public Type Properties

    public static let header = Self("MThd")
    public static let track  = Self("MTrk")

    // MARK: Public Type Methods

    public static func isValid(_ stringValue: String) -> Bool {
        stringValue.count == 4 && stringValue.allSatisfy { $0.isASCII }
    }

    // MARK: Public Initializers

    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    public let stringValue: String
}

// MARK: - Sendable

extension SMFChunkType: Sendable {
}
