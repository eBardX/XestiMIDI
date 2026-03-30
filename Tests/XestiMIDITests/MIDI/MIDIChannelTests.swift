// © 2025–2026 John Gary Pusey (see LICENSE.md)

import Testing
@testable import XestiMIDI

@Suite
struct MIDIChannelTests {
    @Test
    func test_init_bytesValue() {
        let chan = MIDIChannel(bytesValue: [0])

        #expect(chan != nil)

        if let chan {
            #expect(chan.uintValue == 1)
            #expect(chan.bytesValue == [0])
        }
    }

    @Test
    func test_init_intValue() {
    }

    @Test
    func test_isValid() {
        #expect(MIDIChannel.isValid(1))
        #expect(MIDIChannel.isValid(8))
        #expect(MIDIChannel.isValid(16))
        #expect(!MIDIChannel.isValid(0))
        #expect(!MIDIChannel.isValid(17))
        #expect(!MIDIChannel.isValid(9_999_999))
    }
}
