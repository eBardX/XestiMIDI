// © 2025–2026 John Gary Pusey (see LICENSE.md)

public protocol BytesValueConvertible {
    init?(bytesValue: [UInt8])

    var bytesValue: [UInt8]? { get }
}
