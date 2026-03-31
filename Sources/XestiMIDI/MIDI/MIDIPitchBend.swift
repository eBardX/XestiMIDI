// © 2025–2026 John Gary Pusey (see LICENSE.md)

public import XestiTools

public struct MIDIPitchBend: IntRepresentable {

    // MARK: Public Type Methods

    public static func isValid(_ intValue: Int) -> Bool {
        (-8_192...8_191).contains(intValue)
    }

    // MARK: Public Initializers

    public init?(intValue: Int) {
        guard Self.isValid(intValue)
        else { return nil }

        self.intValue = intValue
    }

    // MARK: Public Instance Properties

    public let intValue: Int
}

// MARK: - BytesValueConvertible

extension MIDIPitchBend: BytesValueConvertible {

    // MARK: Public Initializers

    public init?(bytesValue: [UInt8]) {
        guard bytesValue.count == 2
        else { return nil }

        self.init(intValue: ((Int(bytesValue[1]) << 7) | Int(bytesValue[0])) - 8_192)
    }

    // MARK: Public Instance Properties

    public var bytesValue: [UInt8]? {
        let value = intValue + 8_192

        guard let byte0Value = UInt8(exactly: value & 0x7f),
              let byte1Value = UInt8(exactly: value >> 7)
        else { return nil }

        return [byte0Value, byte1Value]
    }
}

// MARK: - Sendable

extension MIDIPitchBend: Sendable {
}
