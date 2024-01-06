//
//  Language.swift
//  tokenizer
//
//  Created by Vadim Tambovtsev on 06/01/2024.
//

import Foundation

enum Language: String, CaseIterable {
    case english = "English"
    case spanish = "Spanish"
    
    var stopWords: [String] {
        switch self {
        case .english:
            return ["and", "if"]
        case .spanish:
            return ["si", "y"]
        }
    }
    
    static let allCasesArray: [String] = allCases.map { $0.rawValue }
    static private let userDefaultsKey = "InputLanguage"
    
    static func getSelectedLanguageIndex() -> Int {
        let selectedIndex: Int? = UserDefaults.standard.integer(forKey: userDefaultsKey)
        if let selectedIndex = selectedIndex {
            return selectedIndex
        } else {
            let defaultIndex = 0
            setSelectedLanguageIndex(index: defaultIndex)
            return defaultIndex
        }
    }
    
    static func setSelectedLanguageIndex(index: Int) {
        UserDefaults.standard.setValue(index, forKey: userDefaultsKey)
    }
    
    static func getSelectedLanguage() -> Language {
        let rawValue = allCasesArray[getSelectedLanguageIndex()]
        return Language(rawValue: rawValue)!        
    }
}
