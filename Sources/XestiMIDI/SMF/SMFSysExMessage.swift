// © 2025–2026 John Gary Pusey (see LICENSE.md)

public enum SMFSysExMessage {
    case escape([UInt8])
    case systemExclusive([UInt8])
}

// MARK: -

extension SMFSysExMessage {

    // MARK: Public Initializers

    public init?(statusByte: UInt8,
                 dataBytes: [UInt8]) {
        switch statusByte {
        case 0xf0:
            self = .systemExclusive(dataBytes)

        case 0xf7:
            self = .escape(dataBytes)

        default:
            return nil
        }
    }

    // MARK: Public Instance Properties

    public var dataBytes: [UInt8]? {
        switch self {
        case let .escape(dataBytes),
             let .systemExclusive(dataBytes):
            dataBytes
        }
    }

    public var statusByte: UInt8? {
        switch self {
        case .escape:
            0xf7

        case .systemExclusive:
            0xf0
        }
    }
}

// MARK: - Sendable

extension SMFSysExMessage: Sendable {
}
