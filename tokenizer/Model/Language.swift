//
//  Language.swift
//  tokenizer
//
//  Created by Vadim Tambovtsev on 06/01/2024.
//

import Foundation

enum Language {
    case english
    case spanish
    
    var stopWords: [String] {
        switch self {
        case .english:
            return ["and", "if"]
        case .spanish:
            return ["si", "y"]
        }
    }
}
