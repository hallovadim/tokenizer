//
//  TokenizerService.swift
//  tokenizer
//
//  Created by Vadim Tambovtsev on 05/01/2024.
//

import Foundation

final class TokenizerService {
    static func getTokenizedSentences(fromText text: String, languageUsed language: Language) -> [[String]] {
        let tokens = text.lowercased().split(separator: " ")
        let stopWords: [String] = language.stopWords
        
        var sentences: [[String]] = []
        var sentence: [String] = []
        tokens.forEach { rawToken in
            let token = String(rawToken)
            if stopWords.contains(token) {
                if sentence.count > 0 {
                    sentences.append(sentence)
                    sentence = [token]
                } else {
                    // do nothing, to avoid repeating stopWords trigger
                }
            } else {
                sentence.append(token)
            }
        }
        
        if sentence.count > 0 {
            sentences.append(sentence)
            sentence = []
        }
        
        return sentences
    }
}
