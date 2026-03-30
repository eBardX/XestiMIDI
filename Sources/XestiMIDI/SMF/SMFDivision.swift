// © 2025–2026 John Gary Pusey (see LICENSE.md)

public enum SMFDivision {
    case metrical(SMFTickRate)
    case timeCode(SMPTETimeCode)
}

// MARK: - BytesValueConvertible

extension SMFDivision: BytesValueConvertible {

    // MARK: Public Initializers

    public init?(bytesValue: [UInt8]) {
        guard bytesValue.count == 2
        else { return nil }

        if (bytesValue[0] & 0x80) == 0 {
            guard let tickRate = SMFTickRate(bytesValue: bytesValue)
            else { return nil }

            self = .metrical(tickRate)
        } else {
            guard let timeCode = SMPTETimeCode(bytesValue: bytesValue)
            else { return nil }

            self = .timeCode(timeCode)
        }
    }

    // MARK: Public Instance Properties

    public var bytesValue: [UInt8]? {
        switch self {
        case let .metrical(tickRate):
            tickRate.bytesValue

        case let .timeCode(timeCode):
            timeCode.bytesValue
        }
    }
}

// MARK: - Sendable

extension SMFDivision: Sendable {
}
