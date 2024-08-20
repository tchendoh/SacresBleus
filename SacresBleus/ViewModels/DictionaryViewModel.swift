//
//  DictionaryViewModel.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-07.
//

import Foundation
import Observation

@Observable
final class DictionaryViewModel {
    var dictionary: [String: Expression] = [:]
    
    init() {
        populateDictionary()
    }
    
    
    func populateDictionary() {
        for expression in expressions {
            var customId = expression.text
            if expression.type == .blasphemyOrigin {
                customId += "_origin"
            }
            dictionary[customId] = expression
        }
    }
}
