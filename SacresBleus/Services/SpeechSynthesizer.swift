//
//  SpeechSynthesizer.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-13.
//

import Foundation
import AVFoundation
import NaturalLanguage

protocol SpeechSynthesizerProviding {
    var synthesizer: AVSpeechSynthesizer { get }
    func speakText(_ text: String)
}

final class SpeechSynthesizer: SpeechSynthesizerProviding {
    var synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    init() {
        
    }

    
    func speakText(_ text: String) {
        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: text)
        
        utterance.voice = AVSpeechSynthesisVoice(language: "fr-CA")

        synthesizer.speak(utterance)
    }
    
    private func detectLanguageOf(text: String) -> NLLanguage? {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        
        guard let language = recognizer.dominantLanguage else {
            return nil
        }
        
        return language
    }
}
