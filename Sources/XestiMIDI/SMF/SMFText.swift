// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

public struct SMFText: StringRepresentable {

    // MARK: Public Initializers

    public init?(stringValue: String) {
        guard Self.isValid(stringValue)
        else { return nil }

        self.stringValue = stringValue
    }

    // MARK: Public Instance Properties

    public let stringValue: String
}

// MARK: - BytesValueConvertible

extension SMFText: BytesValueConvertible {

    // MARK: Public Initializers

    public init?(bytesValue: [UInt8]) {
        let text = String(bytesValue.map { Character(Unicode.Scalar($0)) })

        self.init(stringValue: text)
    }

    // MARK: Public Instance Properties

    public var bytesValue: [UInt8]? {
        Array(stringValue.utf8)
    }
}
