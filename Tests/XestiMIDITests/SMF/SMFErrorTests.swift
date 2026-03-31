// © 2026 John Gary Pusey (see LICENSE.md)

import Testing
@testable import XestiMIDI
import XestiTools

struct SMFErrorTests {
}

// MARK: -

extension SMFErrorTests {
    @Test
    func test_category() {
        let error = SMFError.dataExhaustedPrematurely

        #expect(error.category?.description == "XestiMIDI")
    }

    @Test
    func test_message_badByte() {
        let error = SMFError.badByte(256)

        #expect(error.message.contains("256"))
    }

    @Test
    func test_message_badChunkLength() {
        let error = SMFError.badChunkLength(999)

        #expect(error.message.contains("999"))
    }

    @Test
    func test_message_badVarlen() {
        let error = SMFError.badVarlen(999)

        #expect(error.message.contains("999"))
    }

    @Test
    func test_message_badWord() {
        let error = SMFError.badWord(999)

        #expect(error.message.contains("999"))
    }

    @Test
    func test_message_dataExhaustedPrematurely() {
        let error = SMFError.dataExhaustedPrematurely

        #expect(error.message == "Data exhausted prematurely")
    }

    @Test
    func test_message_emptyTrack() {
        let error = SMFError.emptyTrack

        #expect(!error.message.isEmpty)
    }

    @Test
    func test_message_invalidChannelMessage() {
        let error = SMFError.invalidChannelMessage(0x90, [0x3C])

        #expect(error.message.contains("90"))
    }

    @Test
    func test_message_invalidChunkType() {
        let error = SMFError.invalidChunkType("XXXX")

        #expect(error.message.contains("XXXX"))
    }

    @Test
    func test_message_missingHeaderChunk() {
        let error = SMFError.missingHeaderChunk

        #expect(!error.message.isEmpty)
    }

    @Test
    func test_message_notEnoughTrackChunks() {
        let error = SMFError.notEnoughTrackChunks

        #expect(!error.message.isEmpty)
    }

    @Test
    func test_message_tooManyHeaderChunks() {
        let error = SMFError.tooManyHeaderChunks

        #expect(!error.message.isEmpty)
    }

    @Test
    func test_message_tooManyTrackChunks() {
        let error = SMFError.tooManyTrackChunks

        #expect(!error.message.isEmpty)
    }

    @Test
    func test_message_unexpectedDataByte() {
        let error = SMFError.unexpectedDataByte(0x3C)

        #expect(error.message.contains("3C"))
    }

    @Test
    func test_message_unknownChannelMessageStatus() {
        let error = SMFError.unknownChannelMessageStatus(0xF0)

        #expect(error.message.contains("F0"))
    }

    @Test
    func test_message_unknownEventStatus() {
        let error = SMFError.unknownEventStatus(0xF5)

        #expect(error.message.contains("F5"))
    }
}
